var fs = require('fs');
var mysql = require('mysql2');
var ejs = require('ejs');
let express = require("express");
let app = express();

var admin_connect = false; //외부에서 무단으로 URL을 타고 들어 오는 걸 막음.
var admin_connect_count = 0;
const connection = mysql.createConnection({
    user: 'root',
    password: 'test',
    database: 'admin',
})
app.listen(3000, function(){
    console.log("http://localhost:3000/");
});

app.use(express.urlencoded({ extended: true })); //데이터 인코딩

 
    //========================================================================관리자 페이지 
    app.get('', function (request, response) {
        fs.readFile('index.htm', 'utf8', function (error, data) {
            response.writeHead(200, { 'content-type': 'text/html' });
            response.end(data);
            
        }); //readfile end
 
    }); //get end
    app.post('/index', function (request, response) {
        var body = request.body;
        var admin_check = false;
        connection.query('select * from client_list where client_id=? and client_password=?', //관리자 페이지에서 입력한 관리자 ID와 PASSWROD를 검색 한다.
        [body.admin_id, body.admin_password],
        function (err, result) {
 
            try {
                var temp = (result[0].client_id == "admin"); //만약 자료가 없으면 오류가 발생하여 catch문으로 이동함.
 
                admin_connect = true; //admin에게 페이지 넘겨주는 권한 승인
 
                admin_check = true; //만일 admin이라는 ID가 검색이 된다면 password를 알맞게 작성했다는 뜻.
 
            } catch (e) {
                admin_check = false; //false가 되면 모든 페이지에 접근이 불가능.
                console.log("admin password wrong");
            }
            console.log(err + "   admin DB_ERRO Check");
            if (admin_check) {
                console.log("admin Login Success");
                response.writeHead(302, { 'Location': '/list' });
            }
            else {
 
                response.writeHead(302, { 'Location': '/index' });
            }
            response.end();
        } //function end
        ); //query end
 
 
 
    }); ////////////////app.post 끝
    //========================================================================회원 목록
    app.get('/list', function (request, response) {
 
        if (admin_connect) {
            fs.readFile('list.htm', 'utf8', function (error, data) {
                connection.query('select * from client_list', function (error, result) {
                    console.log(error + "   List Error Check");
                    response.writeHead(200, { 'content-type': 'text/html' });
                    response.end(ejs.render(data, { data: result }));
                }); //query end
            }); //readfile end
        } //if end
        else {
            fs.readFile('false.htm', 'utf8', function (error, data) {
                response.writeHead(200, { 'content-type': 'text/html' });
                response.end(data);
            }); //readfile end
        } //else end
 
    }); //get end
 
    app.post('/list', function (request, response) {
        admin_connect = false;
        response.writeHead(302, { 'Location': '/index' });
        response.end();
    }); //app.post 끝
 
    //========================================================================DB수정
    app.get('/edit/:id', function (request, response) {
        fs.readFile('edit.htm', 'utf8', function (error, data) {
            connection.query('select * from client_list where client_id=?', [request.params.id],
                function (error, result) {
                    console.log(result[0]); //콘솔에 수정할 자료 출력
                    response.writeHead(200, { 'content-type': 'text/html' });
                    response.end(ejs.render(data, { data: result }));
                } //function end
            ); //query end
 
 
        }); //fs end
    }); //get end
 
    app.post('/edit/:id', function (request, response) {
        var body = request.body;
 
        connection.query('update client_list set  client_password=?, client_name=?, client_email=?, client_phone=? where client_id=?',
         [body.client_password, body.client_name, body.client_email, body.client_phone, request.params.id],
          function (err, rosw) {
              console.log(err + "   Edit Error Check");
          } //function end
          ); //request.params.id는 url에서 받아옴.
        response.writeHead(302, { 'Location': '/list' });
        response.end();
    }); //app.post 끝
    //========================================================================회원 찾기
    app.get('/search', function (request, response) {
        if (admin_connect) {
            fs.readFile('search.htm', 'utf8', function (error, data) {
                response.writeHead(200, { 'content-type': 'text/html' });
                response.end(data);
 
            }); //readfile end
        } //if end
        else {
            fs.readFile('false.htm', 'utf8', function (error, data) {
                response.writeHead(200, { 'content-type': 'text/html' });
                response.end(data);
            }); //readfile end
        }
    }); //get end
 
    app.post('/search', function (request, response) {
        var body = request.body;
        var search_id = "%" + body.search_id + "%"; //광범위하게 찾기 위함
        fs.readFile('search.htm', 'utf8', function (error, data) {
            connection.query('select * from client_list where client_id like ?', search_id,
                function (error, result) {
                    console.log(result[0]); //콘솔에 수정할 자료 출력
                    response.writeHead(200, { 'content-type': 'text/html' });
                    response.end(ejs.render(data, { data: result }));
                } //function end
            ); //query end
        }); //fs end
    }); //회원 찾기 끝
    //========================================================================회원 입력
    app.get('/insert', function (request, response) {
        if (admin_connect) {
            fs.readFile('Insert.htm', 'utf8', function (error, data) {
                response.writeHead(200, { 'content-type': 'text/html' });
                response.end(data);
 
            }); //fs end
        } //if end
        else {
            fs.readFile('false.htm', 'utf8', function (error, data) {
                response.writeHead(200, { 'content-type': 'text/html' });
                response.end(data);
            }); //readfile end
        } //else end
 
    });
 
    app.post('/insert', function (request, response) {
 
        var body = request.body;
        console.log(body);
        connection.query('INSERT INTO client_list(client_id, client_password, client_name, client_email, client_phone)values(?,?,?,?,?)',
        [body.client_id, body.client_password, body.client_name, body.client_email, body.client_phone],
        function (err, rosw) {
            console.log(err + "   Insert Error Check");
        } //function end
          ); //query end

        //client.query('create table '+body.first_name+'(First_name varchar(100) not null primary key, Frist_name_email varchar(100))'); //자료를 입력할 때마다 테이블 생성 띄어쓰기 주의할것
        response.writeHead(302, { 'Location': '/list' });
        response.end();
 
 
 
    }); //app.post 끝
    //========================================================================회원 지우기
    app.get('/delete/:id', function (request, response) {
        connection.query('delete from client_list where client_id=?', [request.params.id]);
        response.writeHead(302, { 'location': '/list' });
        response.end();
    }); // dlelete