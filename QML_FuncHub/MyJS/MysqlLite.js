var db
//初始化创建数据库
function initDatabase() {
    db = LocalStorage.openDatabaseSync("mySqlLiteData", "1.0",
                                       "locaol databases test", 100000)
    try {
        db.transaction(function (tx) {
            tx.executeSql(
                        'CREATE TABLE IF NOT EXISTS data(name TEXT, value TEXT)')
        })
    } catch (err) {
        console.log("Error creating table in database: " + err)
    }
}

function insertData(name, value) {
    var res = ""
    if (!db) {
        return
    }
    db.transaction(function (tx) {
        var result = tx.executeSql('INSERT OR REPLACE INTO data VALUES (?,?);',
                                   [name, value])
        if (result.rowsAffected > 0) {
            res = "OK"
        } else {
            res = "Error"
        }
    })
    return res
}

function readData(name) {
    var res
    if (!db) {
        return
    }
    db.transaction(function (tx) {
        var result = tx.executeSql('select value from data where name=?',
                                   [name])
        if (result.rows.length > 0) {
            res = result.rows.item(0).value
        } else {
            res = "Unknown"
        }
    })
    return res
}

function readAllData() {
    var res = new Array
    if (!db) {
        return
    }
    db.transaction(function (tx) {
        var result = tx.executeSql('select * from data')
        if (result.rows.length > 0) {
            for (var i = 0; i < result.rows.length; i++) {
                var resTmp = new Array
                resTmp.push(result.rows[i].name)
                resTmp.push(result.rows[i].value)

                res.push({
                             "name": resTmp[0],
                             "value": resTmp[1]
                         })
            }
        } else {
            res = "Unknown"
        }
    })
    return res
}
