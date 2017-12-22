App = {
	web3Provider: null,
	contracts: {},

	init: function() {
	},

	initWeb3: function() {
		if (typeof web3 !== 'undefined') {
			App.web3Provider = web3.currentProvider;
		} else {
			App.web3Provider = new web3.providers.HttpProvider('http://localhost:8545');
		}
		web3 = new Web3(App.web3Provider);
	},
};

$(function() {
	$(window).load(function() {
		App.initiWeb3();
	});
});
