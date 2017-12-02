angular.module('app.routes', [])

.config(function($stateProvider, $urlRouterProvider) {

  // Ionic uses AngularUI Router which uses the concept of states
  // Learn more here: https://github.com/angular-ui/ui-router
  // Set up the various states which the app can be in.
  // Each state's controller can be found in controllers.js
  $stateProvider
    

      .state('menu.home', {
    url: '/page1',
    views: {
      'side-menu21': {
        templateUrl: 'templates/home.html',
        controller: 'homeCtrl'
      }
    }
  })

  .state('menu.myActivties', {
    url: '/page2',
    views: {
      'side-menu21': {
        templateUrl: 'templates/myActivties.html',
        controller: 'myActivtiesCtrl'
      }
    }
  })

  .state('menu.myContacts', {
    url: '/page3',
    views: {
      'side-menu21': {
        templateUrl: 'templates/myContacts.html',
        controller: 'myContactsCtrl'
      }
    }
  })

  .state('menu', {
    url: '/side-menu21',
    templateUrl: 'templates/menu.html',
    controller: 'menuCtrl'
  })

  .state('menu.myMoney', {
    url: '/page4',
    views: {
      'side-menu21': {
        templateUrl: 'templates/myMoney.html',
        controller: 'myMoneyCtrl'
      }
    }
  })

  .state('menu.myPlaces', {
    url: '/page5',
    views: {
      'side-menu21': {
        templateUrl: 'templates/myPlaces.html',
        controller: 'myPlacesCtrl'
      }
    }
  })

  .state('menu.myMemories', {
    url: '/page6',
    views: {
      'side-menu21': {
        templateUrl: 'templates/myMemories.html',
        controller: 'myMemoriesCtrl'
      }
    }
  })

  .state('menu.myProfile', {
    url: '/page7',
    views: {
      'side-menu21': {
        templateUrl: 'templates/myProfile.html',
        controller: 'myProfileCtrl'
      }
    }
  })

$urlRouterProvider.otherwise('/side-menu21/page1')


});