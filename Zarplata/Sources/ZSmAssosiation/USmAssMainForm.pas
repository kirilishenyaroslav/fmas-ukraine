unit USmAssMainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Ibase, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxTextEdit, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxControls,
  cxGridCustomView, cxGrid, cxGridBandedTableView, cxClasses, dxBar,
  dxBarExtItems, FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet,
  pFibStoredProc, ZProc;

type
  TfrmSmAssForm = class(TForm)
    BarManager: TdxBarManager;
    RefreshBtn: TdxBarLargeButton;
    ExitBtn: TdxBarLargeButton;
    AddReportBtn: TdxBarLargeButton;
    DelReportBtn: TdxBarLargeButton;
    ExportBtn: TdxBarLargeButton;
    GroupBtn: TdxBarLargeButton;
    dxBarButton1: TdxBarButton;
    dxBarLargeButton1: TdxBarLargeButton;
    dxBarLargeButton2: TdxBarLargeButton;
    dxBarLargeButton3: TdxBarLargeButton;
    dxBarLargeButton4: TdxBarLargeButton;
    dxBarButton2: TdxBarButton;
    dxBarLargeButton5: TdxBarLargeButton;
    dxBarLargeButton6: TdxBarLargeButton;
    dxBarLargeButton7: TdxBarLargeButton;
    dxBarLargeButton8: TdxBarLargeButton;
    Styles: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    cxStyle6: TcxStyle;
    cxStyle7: TcxStyle;
    cxStyle8: TcxStyle;
    cxStyle9: TcxStyle;
    cxStyle10: TcxStyle;
    cxStyle11: TcxStyle;
    cxStyle12: TcxStyle;
    cxStyle13: TcxStyle;
    cxStyle14: TcxStyle;
    cxStyle15: TcxStyle;
    cxStyle16: TcxStyle;
    cxStyle17: TcxStyle;
    cxStyle18: TcxStyle;
    cxStyle19: TcxStyle;
    cxStyle20: TcxStyle;
    cxStyle21: TcxStyle;
    cxStyle22: TcxStyle;
    cxStyle23: TcxStyle;
    cxStyle24: TcxStyle;
    cxStyle25: TcxStyle;
    cxStyle26: TcxStyle;
    cxStyle27: TcxStyle;
    cxStyle28: TcxStyle;
    cxStyle29: TcxStyle;
    cxStyle30: TcxStyle;
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    GridBandedTableViewStyleSheetDevExpress: TcxGridBandedTableViewStyleSheet;
    Grid1: TcxGrid;
    Grid1DBTableView1: TcxGridDBTableView;
    Grid1DBTableView1DBColumn1: TcxGridDBColumn;
    Grid1ClNumReport: TcxGridDBColumn;
    grid1ClDateReport: TcxGridDBColumn;
    Grid1DBTableView1DBColumn2: TcxGridDBColumn;
    Grid1Level1: TcxGridLevel;
    WorkDatabase: TpFIBDatabase;
    SmDataSet: TpFIBDataSet;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    SmDataSource: TDataSource;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AddReportBtnClick(Sender: TObject);
    procedure dxBarLargeButton1Click(Sender: TObject);
    procedure ExitBtnClick(Sender: TObject);
    procedure RefreshBtnClick(Sender: TObject);
    procedure DelReportBtnClick(Sender: TObject);
  private
    { Private declarations }
    FCurKodSetup:Integer;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent; DbHandle:TISC_DB_HANDLE; id_user:Int64); reintroduce;
  end;


implementation

uses USmAssEdit, dates, DateUtils;

{$R *.dfm}

{ TfrmSmAssForm }

constructor TfrmSmAssForm.Create(AOwner: TComponent; DbHandle: TISC_DB_HANDLE; id_user: Int64);
begin
     inherited Create(Aowner);
     WorkDatabase.Handle:=DbHandle;
     ReadTransaction.StartTransaction;
     FCurKodSetup:=zproc.CurrentKodSetup(WorkDatabase.Handle);
     SmDataSet.SelectSQL.Text:='SELECT * FROM z_bu_assosiation_sel';
     SmDataSet.Open;
end;

procedure TfrmSmAssForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TfrmSmAssForm.AddReportBtnClick(Sender: TObject);
var T:TfrmSmAssEdit;
    InsSP:TpFibStoredProc;
    id_rec:Integer;
    d:TDateTime;
begin
     T:=TfrmSmAssEdit.Create(self, WorkDatabase.Handle);

     d:=ConvertKodToDate(FCurKodSetup);

     T.DateTimePicker1.Date:=DateUtils.StartOfTheMonth(d);
     //T.DateTimePicker1.MinDate:=T.DateTimePicker1.Date;
     //T.DateTimePicker2.MinDate:=T.DateTimePicker1.Date;
     T.DateTimePicker2.Date:=StrToDate('31.12.9999');

     if T.ShowModal=mrYes
     then begin
               InsSP:=TpFibStoredProc.Create(self);
               InsSP.Database:=WorkDatabase;
               InsSP.Transaction:=WriteTransaction;
               WriteTransaction.StartTransaction;
               InsSP.StoredProcName:='Z_BU_ASSOSIATION_INS';
               InsSP.Prepare;
               InsSP.ParamByName('old_id_sm').Value  :=T.old_sm;
               InsSP.ParamByName('new_id_sm').Value  :=T.new_sm;
               InsSP.ParamByName('kod_setup_b').Value:=dates.ConvertDateToKod(T.DateTimePicker1.Date);
               InsSP.ParamByName('kod_setup_e').Value:=dates.ConvertDateToKod(T.DateTimePicker2.Date);
               InsSP.ExecProc;
               id_rec:=InsSP.ParamByName('id_rec').Value;
               WriteTransaction.Commit;
               SmDataSet.CloseOpen(true);
               SmDataSet.Locate('id_rec',id_rec,[]);
               InsSP.Close;
               InsSP.Free;
     end;
     T.Free;
end;

procedure TfrmSmAssForm.dxBarLargeButton1Click(Sender: TObject);
var T:TfrmSmAssEdit;
    InsSP:TpFibStoredProc;
    id_rec:Integer;
begin
     if (SmDataSet.RecordCount>0)
     then begin
               FCurKodSetup:=zproc.CurrentKodSetup(WorkDatabase.Handle);

               {if   ((FCurKodSetup>=SmDataSet.FieldByName('kod_setup_b').Value)
               and   (FCurKodSetup<=SmDataSet.FieldByName('kod_setup_e').Value))

               or    (FCurKodSetup< SmDataSet.FieldByName('kod_setup_b').Value)

               then begin}
                         T:=TfrmSmAssEdit.Create(self, WorkDatabase.Handle);
                         T.cxTextEdit1.Text:=SmDataSet.FieldByName('old_sm').AsString;
                         T.cxTextEdit2.Text:=SmDataSet.FieldByName('new_sm').AsString;
                         T.cxButtonEdit1.Text:=SmDataSet.FieldByName('old_sm_title').AsString;
                         T.cxButtonEdit2.Text:=SmDataSet.FieldByName('new_sm_title').AsString;
                         T.old_sm:=SmDataSet.FieldByName('old_id_sm').Value;
                         T.new_sm:=SmDataSet.FieldByName('new_id_sm').Value;
                         T.DateTimePicker1.Date:=SmDataSet.FieldByName('kod_setup_b_d').Value;
                         T.DateTimePicker2.Date:=SmDataSet.FieldByName('kod_setup_e_d').Value;

                         if T.ShowModal=mrYes
                         then begin
                                   id_rec:=SmDataSet.FieldByName('id_rec').Value;
                                   InsSP:=TpFibStoredProc.Create(self);
                                   InsSP.Database:=WorkDatabase;
                                   InsSP.Transaction:=WriteTransaction;
                                   WriteTransaction.StartTransaction;
                                   InsSP.StoredProcName:='Z_BU_ASSOSIATION_UPD';
                                   InsSP.Prepare;
                                   InsSP.ParamByName('id_rec').Value     :=SmDataSet.FieldByName('id_rec').Value;
                                   InsSP.ParamByName('old_id_sm').Value  :=T.old_sm;
                                   InsSP.ParamByName('new_id_sm').Value  :=T.new_sm;
                                   InsSP.ParamByName('kod_setup_b').Value:=dates.ConvertDateToKod(T.DateTimePicker1.Date);
                                   InsSP.ParamByName('kod_setup_e').Value:=dates.ConvertDateToKod(T.DateTimePicker2.Date);
                                   InsSP.ParamByName('current_kod_setup').Value:=FCurKodSetup;
                                   InsSP.ExecProc;
                                   id_rec:=InsSP.ParamByName('id_rec').Value;
                                   WriteTransaction.Commit;
                                   SmDataSet.CloseOpen(true);
                                   SmDataSet.Locate('id_rec',id_rec,[]);
                                   InsSP.Close;
                                   InsSP.Free;
                         end;
                         T.Free;
               {end
               else ShowMessage('Поточний період виходить за період дії. Асоціацію не можна редагувати!');}
     end;
end;

procedure TfrmSmAssForm.ExitBtnClick(Sender: TObject);
begin
     Close;
end;

procedure TfrmSmAssForm.RefreshBtnClick(Sender: TObject);
var id_rec:Integer;
begin
     Grid1.BeginUpdate;

     if (SmDataSet.RecordCount>0) then id_rec:=SmDataSet.fieldbyname('id_rec').Value
                                  else id_rec:=-1;

     SmDataSet.CloseOpen(true);

     SmDataSet.Locate('id_rec', id_rec, []);

     Grid1.EndUpdate;
end;

procedure TfrmSmAssForm.DelReportBtnClick(Sender: TObject);
var delSp:TpFIBStoredProc;
begin
     if Application.MessageBox('Ви хочете видалити асоціацію в поточному періоді?', 'Увага!', MB_YESNO + MB_ICONQUESTION) = IDYES
     then begin
               if (SmDataSet.RecordCount>0)
               then begin
                         FCurKodSetup:=zproc.CurrentKodSetup(WorkDatabase.Handle);
                         delSp:=TpFIBStoredProc.Create(self);
                         delSp.Database:=WorkDatabase;
                         delSp.Transaction:=WriteTransaction;
                         WriteTransaction.StartTransaction;
                         delSp.StoredProcName:='Z_BU_ASSOSIATION_DEL';
                         delSp.ParamByName('id_rec').Value:=SmDataSet.FieldByName('id_rec').Value;
                         delSp.ParamByName('current_kod_setup').Value:=FCurKodSetup;
                         delSp.ExecProc;
                         WriteTransaction.Commit;
                         delSp.Close;
                         delSp.Free;
                         RefreshBtnClick(self);
               end;
     end;          
end;

end.
