{******************************************************************************}
{               Автоматизированная система управления персоналом               }
{                                                                              }
{               (c) Донецкий национальный университет, 2002-2004               }
{******************************************************************************}

{                      Пакет "Справочник должностей"                           }
{                 Модуль добавления типов в должности                          }
{                                               ответственный: Тимофеев Антон  }
unit U_SP_Post_AddTypes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, U_SPPost_DataModule, StdCtrls, Buttons, DB, FIBDataSet,
  pFIBDataSet, ExtCtrls, Grids, DBGrids, SPCommon;

type
  TSP_Post_AddTypes = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    DataSource1: TDataSource;
    pFIBDS: TpFIBDataSet;
    SbOk: TBitBtn;
    SbCancel: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure SbOkClick(Sender: TObject);
    procedure SbCancelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    DMod:TDMSPPost;
    id: integer;
  end;

var
  SP_Post_AddTypes: TSP_Post_AddTypes;

implementation

{$R *.dfm}

procedure TSP_Post_AddTypes.FormShow(Sender: TObject);
begin
  GridResize(DBGrid1);
  pFIBDS.Database:=DMod.FIBDatabase;
  pFIBDS.Open;
end;

procedure TSP_Post_AddTypes.SbOkClick(Sender: TObject);
var i,c:integer;
begin
  with DMod do
  try
    FIBWriteTransaction.StartTransaction;
    FIBQuery.SQL.Text:='execute procedure jn_post_type_i(:id_type_post,:id_post);';
    FIBQuery.ParamByName('id_post').AsInteger:=id;
    c:=DBGrid1.SelectedRows.Count;
    if c>0 then
    for i:=0 to C-1 do
    begin
      pFIBDS.GotoBookmark(pointer(DBGrid1.SelectedRows.Items[i]));
      FIBQuery.ParamByName('id_type_post').AsInteger:=pFIBDS['id_type_post'];
      FIBQuery.ExecProc;
    end else
    begin
      FIBQuery.ParamByName('id_type_post').AsInteger:=pFIBDS['id_type_post'];
      FIBQuery.ExecProc;
    end;
    FIBWriteTransaction.Commit;
  except on e: Exception do
  begin
    MessageDlg('Не вдалося додати запис: '+e.Message,mtError,[mbYes],0);
    FIBWriteTransaction.RollBack;
        error:=True;
  end;
  end;
end;

procedure TSP_Post_AddTypes.SbCancelClick(Sender: TObject);
begin
  ModalResult:=mrCancel;
  Close;
end;

procedure TSP_Post_AddTypes.FormCreate(Sender: TObject);
begin
  DMod := TDMSPPost.Create(Self);
end;

end.
