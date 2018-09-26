module.exports = function (wallaby) {
  
  return {
    files: [
      { pattern: 'src/**/*.coffee' }
    ],

    tests: [
      { pattern: 'test/**/*-test.coffee' }
    ],
    
    env: {
      type: 'node',
      params: {
        env: 'NODE_PATH=' + wallaby.projectCacheDir
      }
    },

    testFramework: 'jest',
    debug: true

  };
};