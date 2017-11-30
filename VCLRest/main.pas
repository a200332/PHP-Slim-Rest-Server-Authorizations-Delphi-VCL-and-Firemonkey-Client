unit main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,IdHTTP, IdGlobal, Vcl.StdCtrls;



type
  Tfmmain = class(TForm)
    btnget: TButton;
    Memo3: TMemo;
    btnreset: TButton;
    Label3: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Memo1: TMemo;
    Button1: TButton;
    btngetpricing: TButton;
    Label5: TLabel;
    Label6: TLabel;
    Memo2: TMemo;
    GetJWTbtn: TButton;
    Button3: TButton;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Button2: TButton;
    Button4: TButton;
    Memo4: TMemo;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;


    procedure btngetClick(Sender: TObject);
    procedure btnresetClick(Sender: TObject);
    procedure btngetpricingClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure GetJWTbtnClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);

  private
  JWTToken:string;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmmain: Tfmmain;

implementation
uses IDhttpUtils;

{$R *.dfm}

 //Get
procedure Tfmmain.btngetClick(Sender: TObject);
var
 http:TIDHttp;
begin
http := TIdHttp.Create(nil);
http.HandleRedirects := true;
http.ReadTimeout := 5000;
http.MaxAuthRetries := 0;
http.HTTPOptions := [hoInProcessAuth];

   Http.Request.BasicAuthentication := True;
   Http.Request.Username := 'A.N.';
  Http.Request.Password := 'Other';
  Http.Request.Accept := 'http';
  Http.Request.ContentType := 'application/json';
Memo3.Lines.Text := http.Get('http://private.localhost/htdoc/PhpSlimAuth/public/user');
http.free;

end;

procedure Tfmmain.btnresetClick(Sender: TObject);
begin
memo1.lines.clear;
end;

procedure Tfmmain.Button2Click(Sender: TObject);
begin
memo4.Lines.Free;
end;

procedure Tfmmain.Button3Click(Sender: TObject);
begin
memo2.Lines.Clear;
end;

procedure Tfmmain.Button4Click(Sender: TObject);
var
 http:TIDHttp;
begin
http := TIdHttp.Create(nil);
http.HandleRedirects := true;
http.ReadTimeout := 5000;
http.MaxAuthRetries := 0;
http.HTTPOptions := [hoInProcessAuth];

 //Get the memo authorisation from user
 // then resend in json format
 // 'eyJ0eXAiOiJ...l3ihQ'
 Http.Request.CustomHeaders.Clear;
 if JWTToken<> '' then
begin
 Http.Request.CustomHeaders.AddValue('Authorization',JWTToken);
 Http.Request.BasicAuthentication := False;
 Http.Request.Accept := 'http';
 Http.Request.ContentType := 'application/json';
Memo4.Lines.Text := http.Get('http://private.localhost/htdoc/PhpSlimAuth/public/jwtpricing');
end;
http.free;
end;

procedure Tfmmain.GetJWTbtnClick(Sender: TObject);
var
 http:TIDHttp;
begin
JWTToken:= '';
button4.Enabled:=true;
http := TIdHttp.Create(nil);
http.HandleRedirects := true;
http.ReadTimeout := 5000;
http.MaxAuthRetries := 0;
http.HTTPOptions := [hoInProcessAuth];

 Http.Request.CustomHeaders.Clear;
 Http.Request.BasicAuthentication := true;
 Http.Request.Username := 'temp';
 Http.Request.Password := 'temporary';
 Http.Request.Accept := 'http';
 Http.Request.ContentType := 'application/json';
Memo2.Lines.Text := http.Get('http://private.localhost/htdoc/PhpSlimAuth/public/jwtuser');
JWTToken:= Memo2.lines.text;
http.free;
 end;

procedure Tfmmain.btngetpricingClick(Sender: TObject);
var
 http:TIDHttp;
begin
http := TIdHttp.Create(nil);
http.HandleRedirects := true;
http.ReadTimeout := 5000;
http.MaxAuthRetries := 0;
http.HTTPOptions := [hoInProcessAuth];

 Http.Request.CustomHeaders.Clear;
// Add the custom Header to use -Authorization and password -1234
 Http.Request.CustomHeaders.AddValue('Authorization','1234');
 Http.Request.BasicAuthentication := False;
 Http.Request.Accept := 'http';
 Http.Request.ContentType := 'application/json';
Memo1.Lines.Text := http.Get('http://private.localhost/htdoc/PhpSlimAuth/public/pricing');
http.free;
 end;

procedure Tfmmain.FormShow(Sender: TObject);
begin
   memo3.Clear;
   memo1.Clear;
   button4.Enabled:= false;
end;

end.


