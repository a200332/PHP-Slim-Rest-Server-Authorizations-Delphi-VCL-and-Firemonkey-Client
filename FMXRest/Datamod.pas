unit Datamod;

interface

uses
  System.SysUtils, System.Classes, IPPeerClient, REST.Authenticator.OAuth,
  REST.Authenticator.Simple, REST.Client, REST.Authenticator.Basic,
  Data.Bind.Components, Data.Bind.ObjectScope;

type
  TDM = class(TDataModule)
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

end.
