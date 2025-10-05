import tkinter as tk
from tkinter import font

# ASCII NanoC logo
NCLogo = """

⎡ C N ⎤
⎣ N C ⎦
"""

# hbash GUI setup
class HBashGUI(tk.Tk):
    def __init__(self, w=800, h=600, font_s=14, bg_color="black", text_color="white"):
        super().__init__()
        self.title("HBash terminal [NanoC]")
        self.geometry(f"{w}x{h}")
        self.configure(bg=bg_color)
        self.terminal_font = font.Font(family="Courier", size=font_s);
        self.text = tk.Text(self, bg=bg_color, fg=text_color, font=self.terminal_font)
        self.text.pack(expand=True, fill=tk.BOTH)
        self.text.insert(tk.END, NCLogo + "\n")
        self.text.insert(tk.END, "Welcome to NanoC HBash!\n\n")
        self.text.insert(tk.END, "> ")
        self.text.configure(state=tk.DISABLED)
        self.after(100, self.fakeTerminalOutput)

    def fakeTerminalOutput(self):
        self.text.configure(state=tk.NORMAL)
        # example bash commands | outputs
        outputs = [
            "loading nanodll.dll...",
            "initializing Win16 VM..",
            "HBash ready. type 'help' for commands"
        ]
        for line in outputs:
            self.text.insert(tk.END, line + '\n')
        self.text.insert(tk.END, "$ ")
        self.text.configure(state=tk.DISABLED)

# run hbash GUI
if __name__ == "__main__":
    app = HBashGUI()
    app.mainloop()
