angular.module('Exhibition')
    .filter('thumbnail', function() {
        return function(input, size) {
            if (!input) return '';
            return input.split(".png")
                .join("."+size.toString()+'x'+size.toString()+".png");
        }
    })
    .filter('round', function() {
        return function(input) {
            return Math.round(input);
        }
    })
    .filter('numberType', function() {
        return function(input) {
            return _.filter(input, function(item) {
                return item[1].type == 'number';
            })
        }
    })
    .filter('splitLines', function() {
      return function(text) {
          return text ? String(text).split("\n") : undefined;
      };
    })
    .filter('rawText', function() {
        return function(text) {
          //console.log(text);
          return  text ? String(text).replace(/<[^>]+>/gm, '') : '';
        };
    })
    .filter('toHTML', function() {
        return function(text) {
          return text ? text.split("\n").join("<br />") : '';
        };
    })
    .filter('truncateText', function() {
        return function(input, length) {
            if (length === undefined) length = 500;
            return input.length > length ? input.substr(0,length) + "..." : input;
        }
    })
    .filter('truncateTextWithLink', function() {
        return function(input, length) {
            if (length === undefined) length = 500;
            if (!input) return '';
            return input.length > length ? input.substr(0,length)
                + "...<br /><md-button ng-click=\"showMore()\">[more]</md-button>" : input;
        }
    })
    .filter('limit', function() {
        return function(input, length) {
            if (input === undefined) return null;
            if (input.length > length) {
                input = input.slice(0,length);
            }
            return input;
        }
    })
    .filter('reverse', function() {
        return function(input) {
            return input.reverse();
        }
    })
