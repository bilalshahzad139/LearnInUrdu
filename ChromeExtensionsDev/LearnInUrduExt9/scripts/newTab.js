



//https://developer.chrome.com/extensions/bookmarks
//https://chromium.googlesource.com/chromium/src/+/master/chrome/common/extensions/docs/examples/api/bookmarks/basic/popup.js



$(function () {

    $('#btnSearch').click(function () {
        $('#bookmarks').empty();
        dumpBookmarks($('#search').val());
    });

    
});//End of DOM Ready function



function dumpBookmarks(query) {
    var bookmarkTreeNodes = chrome.bookmarks.getTree(
      function (bookmarkTreeNodes) {
          $('#bookmarks').append(dumpTreeNodes(bookmarkTreeNodes, query));
      });
}
function dumpTreeNodes(bookmarkNodes, query) {
    var list = $('<ul>');
    var i;
    for (i = 0; i < bookmarkNodes.length; i++) {
        list.append(dumpNode(bookmarkNodes[i], query));
    }
    return list;
}

function dumpNode(bookmarkNode, query) {
    if (bookmarkNode.title) {
        if (query && !bookmarkNode.children) {
            if (String(bookmarkNode.title).indexOf(query) == -1) {
                return $('<span></span>');
            }
        }
        var anchor = $('<a>');
        anchor.attr('href', bookmarkNode.url);
        anchor.text(bookmarkNode.title);
        /*
         * When clicking on a bookmark in the extension, a new tab is fired with
         * the bookmark url.
         */
        anchor.click(function () {
            chrome.tabs.create({ url: bookmarkNode.url });
            return false;
        });
        var span = $('<span>');
        

        span.append(anchor);
    }
    var li = $(bookmarkNode.title ? '<li>' : '<div>').append(span);
    if (bookmarkNode.children && bookmarkNode.children.length > 0) {
        li.append(dumpTreeNodes(bookmarkNode.children, query));
    }
    return li;
}