export function sendRequest(method, url) {
    return new Promise(function (resolve, reject) {
        var xhr = new XMLHttpRequest();
        xhr.open(method, url);
        xhr.setRequestHeader('X-Requested-With', 'XMLHttpRequest');
        xhr.onload = resolve;
        xhr.onerror = reject;
        xhr.send();
    });
}
