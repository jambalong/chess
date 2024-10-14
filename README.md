# Chess

This project is part of The Odin project: [Ruby Chess](https://www.theodinproject.com/lessons/ruby-ruby-final-project) in Ruby Curriculum.

## Project Overview

This command-line Chess game allows two players to engage in a match directly through the terminal. The game adheres to standard chess rules, ensuring an authentic experience. Key features include:

## Live Demo
A live demo of the Chess game is available on Replit: [Play Chess on Replit](https://replit.com/@jambalong/chess)

## What I Learned

- **Legal Move Validation**: Prevents illegal moves and properly handles check and checkmate scenarios.
- **Modular Code Design**: Maintains clean, organized code to facilitate debugging and future enhancements.
- **Unit Testing with RSpec**: Improved my skills in writing tests to ensure code reliability and correctness.
- **Object-Oriented Design**: Developed a deeper understanding of modular code organization and the importance of single-responsibility principles in programming.

## Assignment Objectives

1. **Command-Line Chess Game**: Develop a game where two players can play against each other directly in the terminal.
2. **Game Constraints**: Implement rules to prevent illegal moves, with functionality to declare check or checkmate in the correct scenarios.
4. **Testing**: Write comprehensive RSpec tests for critical components. While TDD is not mandatory, ensure that frequently used functionalities are well-tested.
5. **Modular Design**: Maintain clean and modular code. Aim for each method and class to serve a single responsibility, aiding in debugging and maintenance.
6. **Chess Knowledge**: If you're unfamiliar with the game, explore additional resources to understand chess mechanics and rules.
7. **Fun Enhancements**: Enhance the game visually by incorporating Unicode characters for a more engaging game board experience.

**Extra Credits**

1. **Basic AI Player**: Implement a simple AI opponent that can make random legal moves.

## Getting Started

1. **Clone the repository**:
    ```bash
    git clone https://github.com/jambalong/chess.git
    cd chess
    ```

2. **Install dependencies**:
    ```bash
    bundle install
    ```

3. **Run the game**:
    ```bash
    bundle exec ruby chess_game.rb
    ```

## TODO List

- [ ] Add functionality to save board state.
- [ ] Implement castling moves for both players.
- [ ] Add en passant rules for pawns.
