# Lexical Analyzer
Built a Lexer in C for tokenizing input source code.

# Usage
Please ensure you have Flex installed on your system.

1. Clone the repository

   - `git clone https://github.com/alexislayvu/Lexical-Analyzer.git`

2. Go into the directory

   - `cd Lexical-Analyzer`

3. Generate lexer code

   - `flex identifier_token.l`

4. Compile the lexer

   - `gcc lex.yy.c -o output`
  
5. Execute the lexer
   - `output.exe`
  
6. Provide input source code file
   - `input_sourcecode.txt`

# Example
![test_run](https://user-images.githubusercontent.com/54639928/208362660-67229b9c-2962-44ff-9d05-3877ce77604c.png)
