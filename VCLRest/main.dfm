object fmmain: Tfmmain
  Left = 0
  Top = 0
  Caption = 
    'Delphi Rest Client Indy App  for Authorizations  - Basic Auth - ' +
    'Auth API Key -JWT Auth'
  ClientHeight = 534
  ClientWidth = 693
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel
    Left = 8
    Top = 0
    Width = 282
    Height = 23
    Caption = 'Client CRUD INDY Authentication '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label1: TLabel
    Left = 8
    Top = 135
    Width = 293
    Height = 13
    Caption = 'http://private.localhost/htdoc/htdoc/PhpSlimAuth/public/user'
  end
  object Label2: TLabel
    Left = 59
    Top = 154
    Width = 144
    Height = 13
    Caption = 'User: A.N.   password : Other'
  end
  object Label4: TLabel
    Left = 399
    Top = 0
    Width = 214
    Height = 23
    Caption = 'Client CRUD INDY APIKey'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 371
    Top = 135
    Width = 303
    Height = 13
    Caption = 'http://private.localhost/htdoc/htdoc/PhpSlimAuth/public/pricing'
  end
  object Label6: TLabel
    Left = 457
    Top = 154
    Width = 134
    Height = 13
    Caption = 'Header Authorization=1234'
  end
  object Label7: TLabel
    Left = 102
    Top = 539
    Width = 134
    Height = 13
    Caption = 'Header Authorization=1234'
  end
  object Label8: TLabel
    Left = 376
    Top = 475
    Width = 287
    Height = 13
    Caption = 'http://private.localhost/htdoc/PhpSlimAuth/public/jwtpricing'
  end
  object Label9: TLabel
    Left = 20
    Top = 173
    Width = 237
    Height = 23
    Caption = 'Client CRUD INDY JWT Auth'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label10: TLabel
    Left = 376
    Top = 173
    Width = 295
    Height = 23
    Caption = 'Client CRUD INDY JWT Get Pricing '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label11: TLabel
    Left = 248
    Top = 210
    Width = 177
    Height = 13
    Caption = 'After Authorisation Send Get Call -> '
  end
  object Label12: TLabel
    Left = 28
    Top = 475
    Width = 308
    Height = 13
    Caption = 'http://private.localhost/htdoc/htdoc/PhpSlimAuth/public/jwtuser'
  end
  object Label13: TLabel
    Left = 75
    Top = 494
    Width = 168
    Height = 13
    Caption = 'User: temp   password : temporary'
  end
  object Label14: TLabel
    Left = 431
    Top = 494
    Width = 165
    Height = 13
    Caption = 'Header Authorization '#39'Send Token'#39
  end
  object btnget: TButton
    Left = 164
    Top = 29
    Width = 75
    Height = 25
    Caption = 'Get'
    TabOrder = 0
    OnClick = btngetClick
  end
  object Memo3: TMemo
    Left = 12
    Top = 60
    Width = 309
    Height = 69
    Lines.Strings = (
      'Memo3')
    TabOrder = 1
  end
  object btnreset: TButton
    Left = 83
    Top = 29
    Width = 75
    Height = 25
    Caption = 'Reset'
    TabOrder = 2
    OnClick = btnresetClick
  end
  object Memo1: TMemo
    Left = 376
    Top = 60
    Width = 300
    Height = 69
    Lines.Strings = (
      'Memo3')
    TabOrder = 3
  end
  object Button1: TButton
    Left = 431
    Top = 29
    Width = 75
    Height = 25
    Caption = 'Reset'
    TabOrder = 4
    OnClick = btnresetClick
  end
  object btngetpricing: TButton
    Left = 512
    Top = 29
    Width = 75
    Height = 25
    Caption = 'Get'
    TabOrder = 5
    OnClick = btngetpricingClick
  end
  object Memo2: TMemo
    Left = 19
    Top = 236
    Width = 302
    Height = 233
    Lines.Strings = (
      '')
    TabOrder = 6
  end
  object GetJWTbtn: TButton
    Left = 161
    Top = 205
    Width = 75
    Height = 25
    Caption = 'Get'
    TabOrder = 7
    OnClick = GetJWTbtnClick
  end
  object Button3: TButton
    Left = 80
    Top = 205
    Width = 75
    Height = 25
    Caption = 'Reset'
    TabOrder = 8
    OnClick = Button3Click
  end
  object Button2: TButton
    Left = 431
    Top = 205
    Width = 75
    Height = 25
    Caption = 'Reset'
    TabOrder = 9
    OnClick = Button2Click
  end
  object Button4: TButton
    Left = 512
    Top = 205
    Width = 75
    Height = 25
    Caption = 'Get'
    TabOrder = 10
    OnClick = Button4Click
  end
  object Memo4: TMemo
    Left = 371
    Top = 236
    Width = 305
    Height = 233
    TabOrder = 11
  end
end
