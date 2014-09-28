{******************************************************************************}
{               Автоматизированная система управления персоналом               }
{                                                                              }
{               (c) Донецкий национальный университет, 2002-2004               }
{******************************************************************************}

{                      Пакет "Справочник должностей"                           }
{                 Модуль добавления типов должностей                     }
{                                               ответственный: Тимофеев Антон  }
unit U_SP_Post_AddType;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, CheckEditUnit, FieldControl, Buttons,
  U_SPPost_DataModule, DB, FIBDataSet, pFIBDataSet, Grids, DBGrids, ExtCtrls,
  SPCommon, EditControl, uSearchFrame;

type
  TSP_Post_AddType = class(TForm)
    SbOk: TBitBtn;
    SbCancel: TBitBtn;
    FC_Name: TFieldControl;
    Label5: TLabel;
    CE_Name: TCheckEdit;
    Panel1: TPanel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    pFIBDS: TpFIBDataSet;
    SearchFrame: TfmSearch;
    CheckBox1: TCheckBox;
    Panel3: TPanel;
    procedure SbOkClick(Sender: TObject);
    procedure SbCancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure pFIBDSAfterOpen(DataSet: TDataSet);
    procedure GetText(Sender: TField; var Text:String; DisplayText:Boolean);
    procedure CheckBox1Click(Sender: TObject);
  private
    FormControl: TEditControl;
  public
    Add:Boolean;
    id:string;
    DMod:TDMSPPost;
    { Public declarations }
  end;

var
  SP_Post_AddType: TSP_Post_AddType;

implementation

{$R *.dfm}

procedure TSP_Post_AddType.SbOkClick(Sender: TObject);
var i,c:integer;
begin
  FC_Name.Get;
  if not(FC_Name.Check)
   then begin
     MessageDlg('Не вірно введена назва',mtError,[mbYes],0);
     Exit;
   end;
  if not TextOk(CE_Name.Text)
   then begin
     MessageDlg('Не вірно введена назва',mtError,[mbYes],0);
     Exit;
   end;
  with DMod do
  try
    FIBWriteTransaction.StartTransaction;
    FIBDS_Insert.SelectSQL.Clear;
    FIBDS_Insert.SelectSQL.Add('select * from sp_type_post_insert('+QuotedStr(CE_Name.Text)+');');
    FIBDS_Insert.Open;
    if CheckBox1.Checked then
     begin
       FIBQuery.SQL.Text:='execute procedure jn_post_type_i(:id_type_post,:id_post);';
       FIBQuery.ParamByName('id_type_post').AsInteger:=FIBDS_Insert['id_type_post'];
       c:=DBGrid1.SelectedRows.Count;
       for i:=0 to C-1 do
       begin
         pFIBDS.GotoBookmark(pointer(DBGrid1.SelectedRows.Items[i]));
         FIBQuery.ParamByName('id_post').AsInteger:=pFIBDS['id_post'];
         FIBQuery.ExecProc;
       end;
     end;
    FIBWriteTransaction.Commit;
  except on e: Exception do
  begin
    MessageDlg('Не вдалося додати запис: '+e.Message,mtError,[mbYes],0);
    FIBWriteTransaction.RollBack;
    error:=True;
  end;
  end;
  Dmod.FIBDS_Insert.Close;
  DMod.FIBDS_Insert.SelectSQL.Clear;
end;

procedure TSP_Post_AddType.SbCancelClick(Sender: TObject);
begin
  ModalResult:=mrCancel;
  Close;
end;

procedure TSP_Post_AddType.FormShow(Sender: TObject);
begin
  GridResize(DBGrid1);
  pFIBDS.Database:=DMod.FIBDatabase;
  pFIBDS.Open;
  SearchFrame.Prepare(pFIBDS,DBGrid1);
end;

procedure TSP_Post_AddType.FormCreate(Sender: TObject);
begin
  DMod := TDMSPPost.Create(Self);
  FormControl := TEditControl.Create;
  FormControl.Add([FC_Name]);
  FormControl.Prepare(emNew);
end;

procedure TSP_Post_AddType.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FormControl.Free;
end;

procedure TSP_Post_AddType.pFIBDSAfterOpen(DataSet: TDataSet);
begin
  DataSet.FieldByName('Not_digit').OnGetText:=GetText;
end;

procedure TSP_Post_AddType.GetText(Sender: TField; var Text:String; DisplayText:Boolean);
begin
  if (Sender.Value='T') then
   Text := 'Так';
  if (Sender.Value='F') then
   Text := 'Ні';
end;

procedure TSP_Post_AddType.CheckBox1Click(Sender: TObject);
begin
  DBGrid1.Enabled:=CheckBox1.Checked;
end;

end.
