-- nanoasm.lua — NanoASM assembler in Lua (for nano-x32_43)
-- Usage: lua assembler.lua input.asmn output.nhex
-- also this was GPT made so... excuse me LOL

local opcodes = {
    NOP   = 0x00,
    MOV   = 0x01,
    ADD   = 0x02,
    SUB   = 0x03,
    JMP   = 0x04,
    PRINT = 0x05,
    HLT  = 0xFF
}

-- utils
local function trim(s)
    return (s:gsub("^%s+", ""):gsub("%s+$", ""))
end

local function is_comment_or_empty(line)
    return line == "" or line:match("^%s*;")
end

local function parse_reg(s)
    local n = s:match("[Rr](%d+)")
    return n and tonumber(n) or nil
end

-- === PASS 1: collect labels ===
local function collect_labels(lines)
    local labels, addr = {}, 0
    for _, line in ipairs(lines) do
        line = trim(line)
        if not is_comment_or_empty(line) then
            local lbl = line:match("^(%w+):")
            if lbl then
                labels[lbl] = addr
            else
                addr = addr + 3
            end
        end
    end
    return labels
end

-- === PASS 2: assemble instructions ===
local function assemble(lines, labels)
    local out = {}
    for _, line in ipairs(lines) do
        line = trim(line)
        if is_comment_or_empty(line) or line:match(":") then
            -- skip empty/comment/label
        else
            local mnemonic, rest = line:match("^(%S+)%s*(.*)$")
            local opcode = opcodes[mnemonic]
            if not opcode then
                print(string.format("[NanoASM::ERROR] Unknown instruction '%s'", mnemonic))
            else
                table.insert(out, string.format("%02X", opcode))

                if mnemonic == "MOV" then
                    local r, v = rest:match("R(%d+)%s*,%s*(%d+)")
                    table.insert(out, string.format("%02X", tonumber(r) or 0))
                    table.insert(out, string.format("%02X", tonumber(v) or 0))

                elseif mnemonic == "ADD" or mnemonic == "SUB" then
                    local r1, r2 = rest:match("R(%d+)%s*,%s*R(%d+)")
                    table.insert(out, string.format("%02X", tonumber(r1) or 0))
                    table.insert(out, string.format("%02X", tonumber(r2) or 0))

                elseif mnemonic == "PRINT" then
                    local r = parse_reg(rest)
                    table.insert(out, string.format("%02X", r or 0))
                    table.insert(out, "00")

                elseif mnemonic == "JMP" then
                    local target = rest:match("(%w+)")
                    local addr = labels[target] or 0
                    table.insert(out, string.format("%02X", addr))
                    table.insert(out, "00")

                elseif mnemonic == "NOP" or mnemonic == "HLT" then
                    table.insert(out, "00")
                    table.insert(out, "00")
                end
            end
        end
    end
    return out
end

-- === MAIN ===
local input, output = arg and arg[1], arg and arg[2]
if not input or not output then
    print("Usage: lua assembler.lua input.asmn output.nhex")
    os.exit(1)
    return
end

local lines = {}
local infile = io.open(input, "r")
if not infile then
    print("[NanoASM::ERROR] Cannot open input file: " .. tostring(input))
    os.exit(1)
    return
end

for line in infile:lines() do
    table.insert(lines, line)
end
infile:close()

local labels = collect_labels(lines)
local assembled = assemble(lines, labels) or {}

-- open output file
local out = io.open(output, "w")
if not out then
    print("[NanoASM::ERROR] Cannot create output file: " .. tostring(output))
    os.exit(1)
    return
end

-- write assembled code
if assembled then
    out:write("; NanoASM (Lua Edition)\n")
    for i, byte in ipairs(assembled) do
        if byte then
            out:write(byte .. " ")
            if i % 8 == 0 then out:write("\n") end
        end
    end
    out:write("\n")
end

out:close()
print("[NanoASM] Assembled " .. input .. " -> " .. output)
