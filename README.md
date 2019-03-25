# Blockchain_hw3
**Solution:**
* Change the minimum contribution to 5 Ether

*`uint256 public investorMinCap = 5000000000000000000;`

* Change the minimum contribution to 5 Ether

*  `function getTokensLeft() view public returns (uint256) {`

    `uint256 tokensLeft = cap - totalSpent;`
    
    `return tokensLeft;`
    
  `}`


* 1 purchase per account

* `require(_existingContribution == 0, "error:1 purchase per account");`

**How to run:**

**Before test:**
* `truffle compile`
* `truffle develop`
* `migrate --reset`

**Example:**
* `ExampleToken.new("CSC6890 Token", "GSU", 18).then((t) => {token = t;})`
* `ExampleTokenCrowdsale.new(450, web3.eth.accounts[0], token.address , new web3.BigNumber(web3.toWei(150, 'ether'))).then((t) => {sale = t;})`
* `token.transferOwnership(sale.address)`

**Test transactions:**

**1. Try to buy tokens with 2.5 ether:** 
* `sale.buyTokens(web3.eth.accounts[0], {value : new web3.BigNumber(web3.toWei(2.5, 'ether')) , from : web3.eth.accounts[1]})`

* error:minimum contribution is 5 Ether

**2. Buy tokens with 15 ether:** 
* `sale.buyTokens(web3.eth.accounts[0], {value : new web3.BigNumber(web3.toWei(15, 'ether')) , from : web3.eth.accounts[1]})`


**3. Return how many tokens are left:** 
* `sale.getTokensLeft().then(result => result.toNumber())` 

* result:135000000000000000000


**4. Buy tokens (again) with 25 Ether:** 
* `sale.buyTokens(web3.eth.accounts[0], {value : new web3.BigNumber(web3.toWei(25, 'ether')) , from : web3.eth.accounts[1]})`

* error: 1 purchase per account
