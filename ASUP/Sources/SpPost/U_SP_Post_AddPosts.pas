{******************************************************************************}
{               Автоматизированная система управления персоналом               }
{                                                                              }
{               (c) Донецкий национальный университет, 2002-2004               }
{******************************************************************************}

{                      Пакет "Справочник должностей"                           }
{                 Модуль должностей в категории                                }
{                                               ответственный: Тимофеев Антон  }
unit U_SP_Post_AddPosts;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FieldControl, StdCtrls, SpComboBox, ComCtrls, DB, FIBDataSet,
  pFIBDataSet, Grids, DBGrids, ExtCtrls, U_SPPost_DataModule, SpCommon,
  Buttons, EditControl, uSearchFrame;

type
  TSP_Post_AddPosts = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    pFIBDS: TpFIBDataSet;
    DTP_Beg: TDateTimePicker;
    DTP_End: TDateTimePicker;
    Label5: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    SpCB_Cat: TSpComboBox;
    FC_Cat: TFieldControl;
    SbCancel: TBitBtn;
    SbOk: TBitBtn;
    SearchFrame: TfmSearch;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SbOkClick(Sender: TObject);
    procedure SbCancelClick(Sender: TObject);
    procedure pFIBDSAfterOpen(DataSet: TDataSet);
    procedure GetText(Sender: TField; var Text:String; DisplayText:Boolean);
    procedure FormDestroy(Sender: TObject);
  private
    FormControl: TEditControl;
  public
    DMod:TDMSPPost;
    { Public declarations }
  end;

var
  SP_Post_AddPosts: TSP_Post_AddPosts;

implementation

{$R *.dfm}

procedure TSP_Post_AddPosts.FormShow(Sender: TObject);
begin
  SPInit(DMod.FIBDatabase.Handle);
  GridResize(DBGrid1);
  pFIBDS.Database:=DMod.FIBDatabase;
  pFIBDS.Open;
  SearchFrame.Prepare(pFIBDS,DBGrid1);
end;

procedure TSP_Post_AddPosts.FormCreate(Sender: TObject);
begin
  DMod := TDMSPPost.Create(Self);
  FormControl := TEditControl.Create;
  FormControl.Add([FC_Cat]);
  FormControl.Prepare(emNew);
  SpCB_Cat.LoadFromRegistry;
  DTP_Beg.Date:=Date;
  DTP_End.Date:=Infinity_Date;
end;

procedure TSP_Post_AddPosts.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FormControl.Free;
  SpCB_Cat.SaveIntoRegistry;
end;

procedure TSP_Post_AddPosts.SbOkClick(Sender: TObject);
var i,c:integer;
begin
  FormControl.Read;

  if not FormControl.CheckFill then
  begin
    ModalResult := 0;
    Exit;
  end;

  with DMod do
  begin
    FIBQuery.SQL.Text:='execute procedure sp_post_category_insert(:id_post,:id_category,:date_beg,:date_end);';
    FIBQuery.ParamByName('id_category').AsInteger:=SpCB_Cat.GetId;
    FIBQuery.ParamByName('date_beg').AsDate:=DTP_Beg.Date;
    FIBQuery.ParamByName('date_end').AsDate:=DTP_End.Date;
    c:=DBGrid1.SelectedRows.Count;
    for i:=0 to C-1 do
    try
      FIBWriteTransaction.StartTransaction;
      pFIBDS.GotoBookmark(pointer(DBGrid1.SelectedRows.Items[i]));
      FIBQuery.ParamByName('id_post').AsInteger:=pFIBDS['id_post'];
      FIBQuery.ExecProc;
      FIBWriteTransaction.Commit;
    except on e: Exception do
    begin
      MessageDlg('Не вдалося додати запис: '+e.Message,mtError,[mbYes],0);
      FIBWriteTransaction.RollBack;
          error:=True;
    end;
    end;
  end;
end;

procedure TSP_Post_AddPosts.SbCancelClick(Sender: TObject);
begin
  ModalResult:=mrCancel;
  Close;
end;

procedure TSP_Post_AddPosts.GetText(Sender: TField; var Text:String; DisplayText:Boolean);
begin
  if (Sender.Value='T') then
   Text := 'Так';
  if (Sender.Value='F') then
   Text := 'Ні';
end;

procedure TSP_Post_AddPosts.pFIBDSAfterOpen(DataSet: TDataSet);
begin
  DataSet.FieldByName('Not_digit').OnGetText:=GetText;
end;

procedure TSP_Post_AddPosts.FormDestroy(Sender: TObject);
begin
  //SPDone;
end;

end.
