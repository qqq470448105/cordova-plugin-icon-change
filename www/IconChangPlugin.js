var exec = require('cordova/exec');

// 检查手机是否支持
exports.checkSupport = function (success, error) {
    exec(success, error, 'IconChangPlugin', 'checkSupport');
};

// 更改icon
exports.changeIcon = function (param, success, error) {
    exec(success, error, 'IconChangPlugin', 'changeIcon', [param]);
};
