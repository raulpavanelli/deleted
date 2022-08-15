unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DBXMSSQL, Data.DB, Data.SqlExpr,
  Data.FMTBcd, Datasnap.Provider, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Datasnap.DBClient;

type
  TForm1 = class(TForm)
    conection: TSQLConnection;
    qryClienteList: TSQLQuery;
    dspClienteList: TDataSetProvider;
    cdsClienteList: TClientDataSet;
    srcClienteList: TDataSource;
    DBGrid1: TDBGrid;
    qryClienteListID: TIntegerField;
    qryClienteListNOME: TStringField;
    qryClienteListPROFISSAO: TStringField;
    cdsClienteListID: TIntegerField;
    cdsClienteListNOME: TStringField;
    cdsClienteListPROFISSAO: TStringField;
    Panel1: TPanel;
    Edit1: TEdit;
    Button1: TButton;
    Edit2: TEdit;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    function Qt(sValue: String): String;
    procedure SetSQLClientList(iId:integer; sNome:string);
    procedure PesquisaCliente;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
begin
  PesquisaCliente;
end;

procedure TForm1.PesquisaCliente;
begin
  SetSQLClientList(
    StrToIntDef(Edit1.Text,0),
    Edit2.Text
  );

  cdsClienteList.Close;
  cdsClienteList.Open;

end;

function TForm1.Qt(sValue: String): String;
begin
  Result := QuotedStr(sValue);
end;

procedure TForm1.SetSQLClientList(iId: integer; sNome: string);
var
  SQL: string;
begin
  SQL :=
    'SELECT ID ' +
    '     , NOME ' +
    '     , PROFISSAO ' +
    '  FROM cliente' +
    ' WHERE IG_DELET = ' + Qt(' ') ;

  if iId > 0 then
  begin
    SQL := SQL + 'AND ID = ' + Qt(IntToStr(iId));
  end;

  if not sNome.Trim.IsEmpty then
  begin
    SQL := SQL + 'AND NOME LIKE ' + Qt('%'+sNome+'%');
  end;

  qryClienteList.Close;
  qryClienteList.SQL.Text := SQL

end;

end.

