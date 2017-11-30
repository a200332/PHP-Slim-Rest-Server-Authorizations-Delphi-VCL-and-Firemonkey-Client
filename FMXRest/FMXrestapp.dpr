program FMXrestapp;

uses
  FMX.Forms,
  main in 'main.pas' {fmmain},
  Datamod in 'Datamod.pas' {DM: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(Tfmmain, fmmain);
  Application.CreateForm(TDM, DM);
  Application.Run;
end.
