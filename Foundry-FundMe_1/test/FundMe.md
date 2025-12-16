## FundMe Test Execution

#### Earlier Setup

- import the Test from "forge-std/Test.sol"
- Also can import "console" for logging output
- Create a **setup** function, should be **external** like a setter function(setting up value to a variable).
- Create a **Test** function, this function represents **testcases** using **assert** function.
- Then run `forge test` for executing test cases.
- `forge test -vv` should be used when logging any values like `console.log({value})`.
