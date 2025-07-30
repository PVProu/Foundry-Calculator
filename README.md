# Foundry Calculator

**FirstFoundryRepo** is a Solidity-based calculator project developed using [Foundry](https://book.getfoundry.sh/), a blazing fast, portable and modular toolkit for Ethereum application development.

## 🧮 Smart Contract: Calculator

The `Calculator` smart contract implements basic arithmetic operations and is initialized with:

- A configurable starting result.
- An admin address who is exclusively allowed to perform division operations.

### Features

- ✅ **Addition**
- ✅ **Subtraction**
- ✅ **Multiplication**
- ✅ **Division** (admin-only)
- 🔒 **Access Control** via `onlyAdmin` modifier
- ⚠️ **Revert logic** for division by zero and overflow protection
- 🧾 **Event Logging** for all operations

---

## 🧪 Test Suite: CalculatorTest

Using Foundry’s `forge-std/Test.sol`, the contract includes comprehensive test coverage:

### ✅ Unit Tests
- Initial value verification
- Correctness of all arithmetic operations
- Permission checks for admin-only access

### 🔄 Fuzz Testing
- Randomized division tests (fuzzing) using `forge test`

### ⚠️ Negative Tests
- Division by zero
- Unauthorized access to division
- Overflow scenarios

---

## 📁 Project Structure

```
FirstFoundryRepo/
├── lib/                  # Dependencies (forge-std, etc.)
├── src/
│   └── Calculator.sol    # Main smart contract
├── test/
│   └── CalculatorTest.t.sol # Test suite for Calculator
├── .gitignore
├── foundry.toml
└── README.md
```

---

## 🚀 Getting Started

### 1. Clone the repo

```bash
git clone https://github.com/PVProu/Foundry-Calculator.git
cd Foundry-Calculator
```

### 2. Install Foundry (if not already)

```bash
curl -L https://foundry.paradigm.xyz | bash
foundryup
```

### 3. Run tests

```bash
forge test
forge test -vvvv
```

---

## 🔐 Security & Access

The `division()` function is restricted to the admin only. All unauthorized attempts are reverted using `vm.expectRevert()` in the test suite.

---

## 👨‍💻 Author

**Pol Vela Prous**  
GitHub: [PVProu](https://github.com/PVProu)  
Email: polvelaprous@gmail.com  

---

## 📜 License

This project is licensed under the [MIT License](LICENSE-MIT).

