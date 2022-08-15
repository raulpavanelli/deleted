object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 462
  ClientWidth = 704
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 100
    Width = 704
    Height = 362
    Align = alClient
    DataSource = srcClienteList
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'ID'
        Width = 17
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Width = 333
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PROFISSAO'
        Width = 300
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 704
    Height = 100
    Align = alTop
    Caption = 'Panel1'
    TabOrder = 1
    ExplicitWidth = 789
    object Edit1: TEdit
      Left = 32
      Top = 15
      Width = 121
      Height = 21
      TabOrder = 0
      Text = 'Edit1'
    end
    object Button1: TButton
      Left = 47
      Top = 69
      Width = 75
      Height = 25
      Caption = 'Button1'
      TabOrder = 1
      OnClick = Button1Click
    end
    object Edit2: TEdit
      Left = 32
      Top = 42
      Width = 121
      Height = 21
      TabOrder = 2
      Text = 'Edit2'
    end
  end
  object conection: TSQLConnection
    DriverName = 'MSSQL'
    LoginPrompt = False
    Params.Strings = (
      'SchemaOverride=%.dbo'
      'DriverUnit=Data.DBXMSSQL'
      
        'DriverPackageLoader=TDBXDynalinkDriverLoader,DBXCommonDriver250.' +
        'bpl'
      
        'DriverAssemblyLoader=Borland.Data.TDBXDynalinkDriverLoader,Borla' +
        'nd.Data.DbxCommonDriver,Version=24.0.0.0,Culture=neutral,PublicK' +
        'eyToken=91d62ebb5b0d1b1b'
      
        'MetaDataPackageLoader=TDBXMsSqlMetaDataCommandFactory,DbxMSSQLDr' +
        'iver250.bpl'
      
        'MetaDataAssemblyLoader=Borland.Data.TDBXMsSqlMetaDataCommandFact' +
        'ory,Borland.Data.DbxMSSQLDriver,Version=24.0.0.0,Culture=neutral' +
        ',PublicKeyToken=91d62ebb5b0d1b1b'
      'GetDriverFunc=getSQLDriverMSSQL'
      'LibraryName=dbxmss.dll'
      'VendorLib=sqlncli10.dll'
      'VendorLibWin64=sqlncli10.dll'
      'HostName=UPC-PAVANELLI\SQLEXPRESS'
      'DataBase=ESTUDO'
      'MaxBlobSize=-1'
      'LocaleCode=0000'
      'IsolationLevel=ReadCommitted'
      'OSAuthentication=False'
      'PrepareSQL=True'
      'User_Name=sa'
      'Password=mss123'
      'BlobSize=-1'
      'ErrorResourceFile='
      'OS Authentication=False'
      'Prepare SQL=False')
    Connected = True
    Left = 16
    Top = 176
  end
  object qryClienteList: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT ID'
      '     , NOME'
      '     , PROFISSAO'
      '  FROM cliente')
    SQLConnection = conection
    Left = 16
    Top = 224
    object qryClienteListID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object qryClienteListNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 50
    end
    object qryClienteListPROFISSAO: TStringField
      FieldName = 'PROFISSAO'
      Size = 100
    end
  end
  object dspClienteList: TDataSetProvider
    DataSet = qryClienteList
    Left = 16
    Top = 272
  end
  object cdsClienteList: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'dspClienteList'
    Left = 16
    Top = 320
    object cdsClienteListID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsClienteListNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 50
    end
    object cdsClienteListPROFISSAO: TStringField
      FieldName = 'PROFISSAO'
      Size = 100
    end
  end
  object srcClienteList: TDataSource
    DataSet = cdsClienteList
    Left = 16
    Top = 368
  end
end
