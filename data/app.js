var get_params = function(search_string) {

  var parse = function(params, pairs) {
    var pair = pairs[0];
    var parts = pair.split('=');
    var key = decodeURIComponent(parts[0]);
    var value = decodeURIComponent(parts.slice(1).join('='));

    // Handle multiple parameters of the same name
    if (typeof params[key] === "undefined") {
      params[key] = value;
    } else {
      params[key] = [].concat(params[key], value);
    }

    return pairs.length == 1 ? params : parse(params, pairs.slice(1))
  }

  // Get rid of leading ?
  return search_string.length == 0 ? {} : parse({}, search_string.substr(1).split('&'));
}

function reloadContentHome() {
	$("#dev_home").load("https://demo-dev.tools.cg-wire.com/");
  $("#stg_home").load("https://demo-stg.tools.cg-wire.com/");
  $("#prod_home").load("https://demo-prod.tools.cg-wire.com/");
}
function reloadContentStatus() {
  $("#dev_status").load("https://demo-dev.tools.cg-wire.com/status");
  $("#stg_status").load("https://demo-stg.tools.cg-wire.com/status");
  $("#prod_status").load("https://demo-prod.tools.cg-wire.com/status");
}

var params = get_params(location.search);

var rh = params['rh'];
var rs = params['rs'];

if (rh == null){ rh = 2000 };
if (rs == null){ rs = 2000 };

console.log('Set home refresh delay: ' + rh);
console.log('Set status refresh delay: ' + rs);

reloadContentHome();
reloadContentStatus();

window.setInterval("reloadContentHome();", rh);
window.setInterval("reloadContentStatus();", rs);
