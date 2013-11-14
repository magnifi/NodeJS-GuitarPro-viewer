'use strict';
var fs = require('fs');
var tabsRoot = "/Volumes/60000Tabs.to.GuitarPro_www.fullzone.com_upload.by.Auron"

module.exports = {
  run: function (req, res) {
    var subpath = req.query.path || "/"
    var p = tabsRoot + subpath;
    if(fs.existsSync(p)){
      if (fs.lstatSync(p).isFile()){
        res.sendfile(p);
      }else{
        var files = fs.readdirSync(p)
        files = files.map(function (f) {
          var stat = fs.lstatSync(p + f)
          return { 
            name: f,
            path: subpath + f + (stat.isFile() ? '': "/"),
            size: stat.isFile() ? stat.size : void 0,
            isDirectory: stat.isDirectory(),
            isFile: stat.isFile(),
            state: stat
          }
        });
        res.json (files);
      }
    }else{
      res.json("???");
    }
    
  }
};
