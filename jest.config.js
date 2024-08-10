module.exports = {
    testEnvironment: 'node',
    testMatch: ['**/?(*.)+(spec|test).js'],
    transform: {
      '^.+\\.js$': 'babel-jest',
    },
  };
  