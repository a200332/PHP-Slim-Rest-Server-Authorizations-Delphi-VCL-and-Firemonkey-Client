object DM: TDM
  OldCreateOrder = False
  Height = 345
  Width = 375
  object RESTClient1: TRESTClient
    Params = <>
    HandleRedirects = True
    Left = 48
    Top = 32
  end
  object RESTRequest1: TRESTRequest
    Client = RESTClient1
    Params = <>
    Response = RESTResponse1
    SynchronizedEvents = False
    Left = 48
    Top = 88
  end
  object RESTResponse1: TRESTResponse
    Left = 48
    Top = 152
  end
end
