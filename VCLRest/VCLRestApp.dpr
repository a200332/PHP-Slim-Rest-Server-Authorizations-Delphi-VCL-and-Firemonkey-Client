program VCLRestApp;

uses
  Vcl.Forms,
  main in 'main.pas' {fmmain},
  IDhttpUtils in 'IDhttpUtils.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tfmmain, fmmain);
  Application.Run;
end.
