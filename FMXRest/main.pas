unit main;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Rtti, System.Classes,
  System.Variants, FMX.Types, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.Layouts,
  FMX.Memo, FMX.StdCtrls, FMX.ScrollBox, FMX.Controls.Presentation,REST.Types,
  System.JSON, REST.Authenticator.Basic;

type
  Tfmmain = class(TForm)
    ToolBar1: TToolBar;
    Layout1: TLayout;
    Button1: TButton;
    ToolBar2: TToolBar;
    ToolBar3: TToolBar;
    Label1: TLabel;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Label2: TLabel;
    Label3: TLabel;
    Layout2: TLayout;
    Memo3: TMemo;
    Memo4: TMemo;
    Layout3: TLayout;
    Memo5: TMemo;
    Memo6: TMemo;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Label4: TLabel;
    Label5: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
  JWTToken:string;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmmain: Tfmmain;

implementation
uses datamod;

{$R *.fmx}

procedure Tfmmain.Button1Click(Sender: TObject);
begin
 memo5.Lines.Clear;
end;

procedure Tfmmain.Button2Click(Sender: TObject);
var
  JValue:TJSONValue;
 HTTPAuthent:THTTPbasicauthenticator;
begin
//set to defaults;
  dm.RESTRequest1.ResetToDefaults;
  dm.RESTClient1.ResetToDefaults;
  dm.RESTResponse1.ResetToDefaults;


   HTTPAuthent:= THTTPbasicauthenticator.Create('A.N.','Other');
  dm.RESTclient1.BaseURL:= 'http://private.localhost/htdoc/PhpSlimAuth/public/user';
  dm.RESTClient1.Authenticator := HTTPAuthent;
  dm.RESTRequest1.Method:= TRestRequestMethod.rmGET;
  dm.RESTRequest1.Execute;
  //get response message status
 if dm.restresponse1.StatusCode <> 200 then
begin
 memo5.lines.Add(dm.restresponse1.Errormessage);
  end
 else
 begin

 Memo5.lines.Add(dm.RESTResponse1.content);
 //use if content returned is Json
 {jValue:=dm.RESTResponse1.JSONValue;
 Memo5.lines.Add(jValue.ToString); }
 end;
dm.RESTClient1.Disconnect;
HTTPAuthent.free;
  end;

procedure Tfmmain.Button3Click(Sender: TObject);
begin
   memo6.Lines.Clear;
end;
//API Key
procedure Tfmmain.Button4Click(Sender: TObject);
var
  JValue:TJSONValue;
begin
   //set to defaults;
  dm.RESTRequest1.ResetToDefaults;
  dm.RESTClient1.ResetToDefaults;
  dm.RESTResponse1.ResetToDefaults;
  dm.RESTClient1.Authenticator.Free;
  dm.RESTclient1.BaseURL:= 'http://private.localhost/htdoc/PhpSlimAuth/public/pricing';
  dm.RESTClient1.ContentType:='text/html';
   //set header pararms
  dm.RESTRequest1.Params.AddItem('Authorization','1234',TRestRequestParameterKind.pkHTTPHEADER);
  dm.RESTRequest1.Method:= TRestRequestMethod.rmGET;
  dm.RESTRequest1.Execute;
  //get response message status
 if dm.restresponse1.StatusCode <> 200 then
begin
 memo6.lines.Add(dm.restresponse1.Errormessage);
  end
 else
 begin
 Memo6.lines.Add(dm.RESTResponse1.content);
  {jValue:=dm.RESTResponse1.JSONValue;
 Memo6.lines.Add(jValue.ToString); }
 end;
dm.RESTClient1.Disconnect;
  end;

procedure Tfmmain.Button5Click(Sender: TObject);
begin
memo3.Lines.Clear;
end;

procedure Tfmmain.Button6Click(Sender: TObject);
var
  JValue:TJSONValue;
  HTTPAuthent:THTTPbasicauthenticator;
begin
  button8.Enabled:= true;
  //set to defaults;
  dm.RESTRequest1.ResetToDefaults;
  dm.RESTClient1.ResetToDefaults;
  dm.RESTResponse1.ResetToDefaults;
  JWTToken:= '';
   HTTPAuthent:= THTTPbasicauthenticator.Create('temp','temporary');
  dm.RESTclient1.BaseURL:= 'http://private.localhost/htdoc/PhpSlimAuth/public/jwtuser';
  dm.RESTClient1.Authenticator := HTTPAuthent;
  dm.RESTRequest1.Method:= TRestRequestMethod.rmGET;
  dm.RESTRequest1.Execute;
  //get response message status
 if dm.restresponse1.StatusCode <> 200 then
begin
 memo3.lines.Add(dm.restresponse1.Errormessage);
  end
 else
 begin
 Memo3.lines.Add(dm.RESTResponse1.content);

 JWTToken := dm.RESTResponse1.content;
// Memo3.lines.Add(jValue.ToString);
 end;
  dm.RESTClient1.Disconnect;
 HTTPAuthent.Free;
   end;

procedure Tfmmain.Button7Click(Sender: TObject);
begin
memo4.Lines.Clear;
end;

procedure Tfmmain.Button8Click(Sender: TObject);
var
  JValue:TJSONValue;
begin
  //set to defaults;
  dm.RESTRequest1.ResetToDefaults;
  dm.RESTClient1.ResetToDefaults;
  dm.RESTResponse1.ResetToDefaults;
   dm.RESTclient1.BaseURL:= 'http://private.localhost/htdoc/PhpSlimAuth/public/jwtpricing';
  dm.RESTClient1.ContentType:='text/html';
  dm.RESTClient1.Authenticator.Free;
   dm.RESTRequest1.Params.AddItem('Authorization',JWTToken,TRestRequestParameterKind.pkHTTPHEADER);
  dm.RESTRequest1.Method:= TRestRequestMethod.rmGET;
  dm.RESTRequest1.Execute;
  //get response message status
 if dm.restresponse1.StatusCode <> 200 then
begin
 memo4.lines.Add(dm.restresponse1.Errormessage);
  end
 else
 begin
 {jValue:=dm.RESTResponse1.JSONValue;
 Memo4.lines.Add(jValue.ToString); }
  Memo4.lines.Add(dm.RESTResponse1.Content);
 end;
  dm.RESTClient1.Disconnect;
  end;

procedure Tfmmain.FormShow(Sender: TObject);
begin
memo3.Lines.Clear;
memo4.Lines.Clear;
memo5.Lines.Clear;
memo6.Lines.Clear;
button8.Enabled:= false;
end;

end.
