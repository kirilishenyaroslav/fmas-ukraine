unit UmainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ibase, dates, ExtCtrls, dxBar, dxBarExtItems, FIBDatabase,
  pFIBDatabase, cxGridBandedTableView, cxClasses, cxStyles, cxGridTableView,
  ComCtrls,pFibDataSet, pFibStoredProc, DB, FIBDataSet, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, cxDBData,
  cxGridCustomTableView, cxGridDBBandedTableView, cxGridLevel, cxControls,
  cxGridCustomView, cxGrid, cxTextEdit, cxCheckBox, StdCtrls, cxContainer,
  cxMaskEdit, cxButtonEdit, PackageLoad, ZProc, cxGridDBTableView;

type
  TfrmZPersModule1 = class(TForm)
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
    WorkDatabase: TpFIBDatabase;
    WriteTransaction: TpFIBTransaction;
    ReadTransaction: TpFIBTransaction;
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
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel1: TPanel;
    Panel2: TPanel;
    ProgressBar1: TProgressBar;
    DataSet6: TpFIBDataSet;
    DataSet7: TpFIBDataSet;
    DetailGridBanded: TcxGrid;
    GridDBBandedTableView6: TcxGridDBBandedTableView;
    DetailGridLevel4: TcxGridLevel;
    Col5_6: TcxGridDBBandedColumn;
    Col6_6: TcxGridDBBandedColumn;
    Col7_6: TcxGridDBBandedColumn;
    Col8_6: TcxGridDBBandedColumn;
    Col9_6: TcxGridDBBandedColumn;
    Col10_6: TcxGridDBBandedColumn;
    Col11_6: TcxGridDBBandedColumn;
    Col12_6: TcxGridDBBandedColumn;
    Col13_6: TcxGridDBBandedColumn;
    Col14_6: TcxGridDBBandedColumn;
    cxGrid1: TcxGrid;
    cxGridDBBandedTableView1: TcxGridDBBandedTableView;
    Col5: TcxGridDBBandedColumn;
    Col6: TcxGridDBBandedColumn;
    Col7: TcxGridDBBandedColumn;
    Col8: TcxGridDBBandedColumn;
    Col9: TcxGridDBBandedColumn;
    Col12: TcxGridDBBandedColumn;
    Col13: TcxGridDBBandedColumn;
    cxGridLevel1: TcxGridLevel;
    Col14: TcxGridDBBandedColumn;
    Col15: TcxGridDBBandedColumn;
    Col16: TcxGridDBBandedColumn;
    Col10: TcxGridDBBandedColumn;
    Col11: TcxGridDBBandedColumn;
    DataSource6: TDataSource;
    DataSource7: TDataSource;
    Panel3: TPanel;
    cxButtonEdit1: TcxButtonEdit;
    Label1: TLabel;
    cxCheckBox1: TcxCheckBox;
    cxTextEdit1: TcxTextEdit;
    dxBarLargeButton7: TdxBarLargeButton;
    dxBarLargeButton8: TdxBarLargeButton;
    SysInfo: TpFIBDataSet;
    TabSheet4: TTabSheet;
    cxGrid3: TcxGrid;
    cxGridDBTableView2: TcxGridDBTableView;
    g7col8: TcxGridDBColumn;
    g7col12: TcxGridDBColumn;
    g7col13: TcxGridDBColumn;
    g7col14: TcxGridDBColumn;
    cxGridLevel3: TcxGridLevel;
    g7col10: TcxGridDBColumn;
    g7col16: TcxGridDBColumn;
    GDataSet7: TpFIBDataSet;
    GDataSource7: TDataSource;
    g7col11: TcxGridDBColumn;
    PeriodsCB: TComboBox;
    Label2: TLabel;
    GridDBBandedTableView6DBBandedColumn1: TcxGridDBBandedColumn;
    GridDBBandedTableView6DBBandedColumn2: TcxGridDBBandedColumn;
    cxGridDBBandedTableView1DBBandedColumn1: TcxGridDBBandedColumn;
    cxGridDBBandedTableView1DBBandedColumn2: TcxGridDBBandedColumn;
    Percent: TcxGridDBBandedColumn;
    gPercent: TcxGridDBColumn;
    TypeStavkaDataSet: TpFIBDataSet;
    TypeStavkaDataSource: TDataSource;
    cxGridDBBandedTableView1DBBandedColumn3: TcxGridDBBandedColumn;
    cxGridDBBandedTableView1DBBandedColumn4: TcxGridDBBandedColumn;
    cxGridDBBandedTableView1DBBandedColumn5: TcxGridDBBandedColumn;
    cxGridDBBandedTableView1DBBandedColumn6: TcxGridDBBandedColumn;
    cxGridDBBandedTableView1DBBandedColumn7: TcxGridDBBandedColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dxBarLargeButton6Click(Sender: TObject);
    procedure ExitBtnClick(Sender: TObject);
    procedure cxButtonEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxCheckBox1PropertiesChange(Sender: TObject);
    procedure cxTextEdit1Exit(Sender: TObject);
    procedure cxTextEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RefreshBtnClick(Sender: TObject);
    procedure dxBarLargeButton7Click(Sender: TObject);
    procedure dxBarLargeButton8Click(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure AddReportBtnClick(Sender: TObject);
    procedure dxBarLargeButton1Click(Sender: TObject);
    procedure DelReportBtnClick(Sender: TObject);
  private
    { Private declarations }
    FKodSetup:Integer;
    FidReport:Int64;
    FFilteridman:Int64;
    FFilterTN:Integer;
    FFormStatus:Integer;
    ActualDate:TDateTime;
    procedure GetMan;
    procedure Forming67Tables;
    procedure GetData;
    procedure SetStatus(status:Integer);
    function SetNewStatus:Integer;
    procedure GetPeriodsListBox;
  public
    { Public declarations }
    function getKodSetup:Integer;
    constructor Create(AOwner:TComponent;DBHanlde:TISC_DB_HANDLE;id_user:Int64;kodsetup:Integer;idreport:Int64);reintroduce;
  end;


implementation

{$R *.dfm}

uses UTable6RowInfo, UTable6NewRowInfo, cxCalc, DateUtils;

procedure TfrmZPersModule1.GetMan;
var Man:Variant;
begin
  if cxTextEdit1.Text<>''
  then begin
            if StrToInt(cxTextEdit1.Text)=FFilterTN then Exit;
            Man:=ManByTn(StrToInt(cxTextEdit1.Text),WorkDatabase.Handle);
            if VarArrayDimCount(Man)>0
            then begin
                      FFilteridman:=Man[0];
                      cxButtonEdit1.text := VarToStr(Man[1])+ '  '+VarToStr(Man[2]);
                      RefreshBtn.OnClick(RefreshBtn);
            end;
  end
  else begin
            FFilteridman:=-1;
            cxButtonEdit1.text := '';
            cxTextEdit1.Text   := '';
  end;
end;


constructor TfrmZPersModule1.Create(AOwner: TComponent; DBHanlde: TISC_DB_HANDLE; id_user: Int64; kodsetup:Integer;idreport:Int64);
begin
     inherited Create(AOwner);
     ActualDate:=ConvertKodToDate(kodsetup);
     PageControl1.ActivePageIndex:=0;
     self.Caption:=Self.Caption+' за період '+KodSetupToPeriod(kodsetup,1);
     self.Update;
     FKodSetup:=kodsetup;
     FidReport:=idreport;
     WorkDatabase.Handle:=DBHanlde;
     ReadTransaction.StartTransaction;

     GetPeriodsListBox;

     if ActualDate<=StrToDate('31.12.2010')
     then begin
               if (PeriodsCB.Items.Count>=1)
               then begin
                         TabSheet1.TabVisible:=true;
                         DataSet6.SelectSQL.Text:='SELECT * FROM z_personification_sum6('+IntToStr(FidReport)+','+IntToStr(Integer(PeriodsCB.Items.Objects[PeriodsCB.ItemIndex]))+')';
                         DataSet6.Open;
                         GridDBBandedTableView6.Controller.FocusedRowIndex:=0;

                         TabSheet2.TabVisible:=true;
                         DataSet7.SelectSQL.Text:='SELECT * FROM z_personification_sum7('+IntToStr(FidReport)+','+IntToStr(Integer(PeriodsCB.Items.Objects[PeriodsCB.ItemIndex]))+')';
                         DataSet7.Open;
                         cxGridDBBandedTableView1.Controller.FocusedRowIndex:=0;

                         TabSheet4.TabVisible:=true;
                         GDataSet7.SelectSQL.Text :='SELECT * FROM Z_PERSONIFICATION_SUM7G('+IntToStr(FidReport)+','+IntToStr(Integer(PeriodsCB.Items.Objects[PeriodsCB.ItemIndex]))+')';
                         GDataSet7.Open;
               end;
     end
     else begin
               Self.Caption:='Таблиця 6';
               TabSheet2.Caption:='Таблиця 6';

               Percent.Visible:=True;
               Percent.DataBinding.FieldName:='Percent';

               gPercent.Visible:=True;
               gPercent.DataBinding.FieldName:='Percent';

               cxGridDBBandedTableView1DBBandedColumn3.Visible:=true;
               cxGridDBBandedTableView1DBBandedColumn4.Visible:=true;


               if (PeriodsCB.Items.Count>=1)
               then begin
                         TabSheet2.TabVisible:=true;
                         DataSet7.SelectSQL.Text:='SELECT * FROM Z_PERSONIFICATION_SUM7_2011('+IntToStr(FidReport)+','+IntToStr(Integer(PeriodsCB.Items.Objects[PeriodsCB.ItemIndex]))+')';
                         DataSet7.Open;

                         cxGridDBBandedTableView1.Controller.FocusedRowIndex:=0;
                         cxGridDBBandedTableView1.Bands[3].Visible:=false;
                         Col9.Visible:=False;
                         Col12.Caption:='Загальна сума нарахованої заробітної плати/доходу (усього з початку звітного місяця)';
                         Col13.Caption:='Cума нарахованої заробітної плати/доходу у межах максимальної величини, на яку нараховується єдиний внесок';
                         Col14.Caption:='Сума єдиного внеску за звітний місяць (із заробітної плати/доходу)';
                         g7Col12.Caption:='Загальна сума нарахованої заробітної плати/доходу (усього з початку звітного місяця)';
                         g7Col13.Caption:='Cума нарахованої заробітної плати/доходу у межах максимальної величини, на яку нараховується єдиний внесок';
                         g7Col14.Caption:='Сума єдиного внеску за звітний місяць (із заробітної плати/доходу)';

                         TabSheet1.TabVisible:=false;

                         TabSheet4.TabVisible:=true;
                         GDataSet7.SelectSQL.Text :='SELECT * FROM Z_PERSONIFICATION_SUM7G('+IntToStr(FidReport)+','+IntToStr(Integer(PeriodsCB.Items.Objects[PeriodsCB.ItemIndex]))+')';
                         GDataSet7.Open;
               end;
     end;


     SysInfo.SelectSQL.Text:='SELECT * FROM PERSON_FORM_STATUS FS WHERE FS.ID_PERSON_DOCUMENT='+
     IntToStr(FidReport)+' AND '+'FS.KOD_SETUP='+IntToStr(FKodSetup)+' AND '+'FS.ID_PERSON_FORM IN (6,8)';

     SysInfo.Open;
     if SysInfo.RecordCount>0
     then begin
               FFormStatus:=SysInfo.FieldByName('STATUS').Value;
     end
     else FFormStatus:=0;

     SetStatus(FFormStatus);

     TypeStavkaDataSet.SelectSQL.Text:='select * from person_type_stavka_sel('+''''+DateToStr(ActualDate)+''''+')';
     TypeStavkaDataSet.Open;
     TypeStavkaDataSet.FetchAll;


end;

function TfrmZPersModule1.getKodSetup: Integer;
begin
     Result:=FKodSetup;
end;

procedure TfrmZPersModule1.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TfrmZPersModule1.dxBarLargeButton6Click(Sender: TObject);
begin
     if Application.MessageBox('Сформувати таблиці на базі даних заробітної плати автоматично?',
       'Увага!', MB_YESNO + MB_ICONQUESTION) = IDYES then
     begin
          Forming67Tables;
     end;
end;

procedure TfrmZPersModule1.Forming67Tables;
var IteratorQuery:TpFibDataSet;
    FormProcedure, ClearSP:TpFibStoredProc;
begin
     Screen.Cursor:=crHourGlass;

     ClearSP:=TpFibStoredProc.Create(self);
     ClearSP.Database:=WorkDatabase;
     ClearSP.Transaction:=WriteTransaction;
     WriteTransaction.StartTransaction;
     ClearSP.StoredProcName:='Z_PERSONIFICATION_SUM67_CLEAR';
     ClearSP.Prepare;
     ClearSP.ParamByName('id_report').AsInt64:=FidReport;
     ClearSP.ExecProc;
     WriteTransaction.Commit;
     ClearSP.Close;
     ClearSP.Free;

     IteratorQuery:=TpFibDataSet.Create(self);
     IteratorQuery.Database:=WorkDatabase;
     IteratorQuery.Transaction:=ReadTransaction;
     IteratorQuery.SelectSQL.Text:=' select * from z_personification_anketa a where a.id_report='+IntToStr(FidReport);
     IteratorQuery.Open;
     IteratorQuery.First;
     ProgressBar1.Min:=1;
     ProgressBar1.Step:=1;
     ProgressBar1.Max:=IteratorQuery.RecordCountFromSrv;

     FormProcedure:=TpFibStoredProc.Create(self);
     FormProcedure.Database:=WorkDatabase;
     FormProcedure.Transaction:=WriteTransaction;
     FormProcedure.StoredProcName:='Z_PERSONIFICATION_2010';

     while not IteratorQuery.Eof do
     begin
          WriteTransaction.StartTransaction;
          FormProcedure.Prepare;
          FormProcedure.ParamByName('id_report').AsInt64:=FidReport;
          FormProcedure.ParamByName('id_anketa').Value  :=IteratorQuery.FieldByName('id').Value;
          FormProcedure.ParamByName('kod_setup').Value  :=FKodSetup;
          FormProcedure.ExecProc;
          IteratorQuery.Next;
          ProgressBar1.StepIt;

          Application.ProcessMessages;
          WriteTransaction.Commit;

     end;
     GetPeriodsListBox;

     FormProcedure.Close;
     FormProcedure.Free;

     IteratorQuery.Close;
     IteratorQuery.Free;

     GetData;

     Screen.Cursor:=crDefault;
end;

procedure TfrmZPersModule1.ExitBtnClick(Sender: TObject);
begin
     Close;
end;

procedure TfrmZPersModule1.GetData;
begin
     if (PeriodsCB.Items.Count=0) then GetPeriodsListBox;

     if ActualDate<=StrToDate('31.12.2010')
     then begin
               if (PeriodsCB.Items.Count>=1)
               then begin
                         DataSet6.Close;
                         if cxCheckBox1.Checked and (FFilteridman>0)
                         then DataSet6.SelectSQL.Text:='SELECT * FROM z_personification_sum6('+IntToStr(FidReport)+','+IntToStr(Integer(PeriodsCB.Items.Objects[PeriodsCB.ItemIndex]))+') where id_man='+IntToStr(FFilteridman)
                         else DataSet6.SelectSQL.Text:='SELECT * FROM z_personification_sum6('+IntToStr(FidReport)+','+IntToStr(Integer(PeriodsCB.Items.Objects[PeriodsCB.ItemIndex]))+')';
                         DataSet6.Open;

                         GridDBBandedTableView6.Controller.FocusedRowIndex:=0;

                         DataSet7.Close;
                         if cxCheckBox1.Checked and (FFilteridman>0)
                         then DataSet7.SelectSQL.Text:='SELECT * FROM z_personification_sum7('+IntToStr(FidReport)+','+IntToStr(Integer(PeriodsCB.Items.Objects[PeriodsCB.ItemIndex]))+') where id_man='+IntToStr(FFilteridman)
                         else DataSet7.SelectSQL.Text:='SELECT * FROM z_personification_sum7('+IntToStr(FidReport)+','+IntToStr(Integer(PeriodsCB.Items.Objects[PeriodsCB.ItemIndex]))+')';
                         DataSet7.Open;

                         cxGridDBBandedTableView1.Controller.FocusedRowIndex:=0;

                         GDataSet7.Close;
                         GDataSet7.SelectSQL.Text :='SELECT * FROM Z_PERSONIFICATION_SUM7G('+IntToStr(FidReport)+','+IntToStr(Integer(PeriodsCB.Items.Objects[PeriodsCB.ItemIndex]))+')';
                         GDataSet7.Open;
               end;
     end
     else begin
               if (PeriodsCB.Items.Count>=1)
               then begin
                         DataSet7.Close;
                         if cxCheckBox1.Checked and (FFilteridman>0)
                         then DataSet7.SelectSQL.Text:='SELECT * FROM z_personification_sum7_2011('+IntToStr(FidReport)+','+IntToStr(Integer(PeriodsCB.Items.Objects[PeriodsCB.ItemIndex]))+') where id_man='+IntToStr(FFilteridman)
                         else DataSet7.SelectSQL.Text:='SELECT * FROM z_personification_sum7_2011('+IntToStr(FidReport)+','+IntToStr(Integer(PeriodsCB.Items.Objects[PeriodsCB.ItemIndex]))+')';
                         DataSet7.Open;

                         cxGridDBBandedTableView1.Controller.FocusedRowIndex:=0;

                         GDataSet7.Close;
                         GDataSet7.SelectSQL.Text :='SELECT * FROM Z_PERSONIFICATION_SUM7G('+IntToStr(FidReport)+','+IntToStr(Integer(PeriodsCB.Items.Objects[PeriodsCB.ItemIndex]))+')';
                         GDataSet7.Open;
               end;
     end;
end;

procedure TfrmZPersModule1.cxButtonEdit1PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var Man:Variant;
begin
     Man:=LoadPeopleModal(Self,WorkDatabase.Handle);
     if VarArrayDimCount(Man)> 0
     then begin
               If Man[0]<>NULL
               then begin
                         FFilteridman:=Man[0];
                         //FFilterTN   :=Man[1];
                         cxButtonEdit1.text := VarToStr(Man[1])+' '+VarToStr(Man[2]);
                         RefreshBtn.OnClick(RefreshBtn);
               end;
     end;

end;

procedure TfrmZPersModule1.cxCheckBox1PropertiesChange(Sender: TObject);
begin
     cxTextEdit1.Enabled:=cxCheckBox1.Checked;
     cxButtonEdit1.Enabled:=cxCheckBox1.Checked;
end;

procedure TfrmZPersModule1.cxTextEdit1Exit(Sender: TObject);
begin
     GetMan;
end;

procedure TfrmZPersModule1.cxTextEdit1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
      if Key=vk_return then GetMan;
end;

procedure TfrmZPersModule1.RefreshBtnClick(Sender: TObject);
begin
     GetData
end;

procedure TfrmZPersModule1.SetStatus(status: Integer);
begin
     if (status=1)
     then begin
               dxBarLargeButton6.Enabled:=false;
               AddReportBtn.Enabled:=false;
               DelReportBtn.Enabled:=false;
               dxBarLargeButton1.Enabled:=false;
     end
     else begin
               dxBarLargeButton6.Enabled:=true;
               AddReportBtn.Enabled:=true;
               DelReportBtn.Enabled:=true;
               dxBarLargeButton1.Enabled:=true;
     end;
end;

procedure TfrmZPersModule1.dxBarLargeButton7Click(Sender: TObject);
var ns:Integer;
begin
     if (FFormStatus=0)
     then begin
               SetStatus(SetNewStatus);
     end
     else ShowMessage('Інформація по таблиці вже підписано!');
end;

procedure TfrmZPersModule1.dxBarLargeButton8Click(Sender: TObject);
begin
     if (FFormStatus=1)
     then begin
               SetStatus(SetNewStatus);
     end
     else ShowMessage('Інформація по таблиці ще не підписано!');
end;

function TfrmZPersModule1.SetNewStatus: Integer;
var UpdSP:TpFIBStoredProc;
    Res:Integer;
begin
     Res:=FFormStatus;
     UpdSP:=TpFIBStoredProc.Create(self);
     UpdSP.Database:=WorkDatabase;
     UpdSP.Transaction:=WriteTransaction;
     WriteTransaction.StartTransaction;
     UpdSP.StoredProcName:='PERSON_FORM_STATUS_UPD';
     UpdSP.Prepare;

     UpdSP.ParamByName('ID_FORM_STATUS').Value:=SysInfo.FieldByname('ID_FORM_STATUS').Value;
     if FFormStatus=0
     then begin
               UpdSP.ParamByName('STATUS').Value:=1;
               Res:=1;
     end
     else begin
               UpdSP.ParamByName('STATUS').Value:=0;
               Res:=0;
     end;

     UpdSP.ExecProc;

     WriteTransaction.Commit;

     SysInfo.CloseOpen(true);

     UpdSP.Close;
     UpdSP.Free;

     Self.FFormStatus:=Res;
     Result:=Res;

end;

procedure TfrmZPersModule1.PageControl1Change(Sender: TObject);
begin
     if PageControl1.ActivePageIndex in [1,2]
     then begin
               dxBarLargeButton6.Enabled:=false;
               AddReportBtn.Enabled:=false;
               DelReportBtn.Enabled:=false;
               dxBarLargeButton1.Enabled:=false;
     end
     else begin
               dxBarLargeButton6.Enabled:=true;
               AddReportBtn.Enabled:=true;
               DelReportBtn.Enabled:=true;
               dxBarLargeButton1.Enabled:=true;
     end;
     SetStatus(FFormStatus);
end;

procedure TfrmZPersModule1.AddReportBtnClick(Sender: TObject);
var T:TfrmTable6Row;
    F:TfrmTable6RowNew;
    UpdateSp:TpFIBStoredProc;
    id_record:Int64;
begin
     if (PageControl1.ActivePageIndex=0)
     then begin
               T:=TfrmTable6Row.Create(self, WorkDatabase.Handle);

               T.col6_7.Enabled:=True;
               if T.ShowModal=mrYes
               then begin
                         UpdateSp:=TpFIBStoredProc.Create(self);
                         UpdateSp.Database:=WorkDatabase;
                         UpdateSp.Transaction:=WriteTransaction;
                         WriteTransaction.StartTransaction;
                         UpdateSp.StoredProcName:='Z_PERSON6_INS';
                         UpdateSp.Prepare;
                         UpdateSp.ParamByName('KOD_CATEGORII').Value  :=T.col8.Text;
                         UpdateSp.ParamByName('TYPE_STAVKA').Value    :=T.col9.Text;
                         UpdateSp.ParamByName('SUMMA_ZAR').Value      :=T.col10.EditValue;
                         UpdateSp.ParamByName('SUMMA_ZAR_LIMIT').Value:=T.col11.EditValue;
                         UpdateSp.ParamByName('SUMMA_VZNOS').Value    :=T.col12.EditValue;
                         UpdateSp.ParamByName('OZN_WORK').Value       :=Integer(T.col13.Checked);
                         UpdateSp.ParamByName('IS_SCIENCE').Value     :=Integer(T.col14.Checked);

                         UpdateSp.ParamByName('id_man').asint64       :=T.FIdman;
                         UpdateSp.ParamByName('ID_REPORT').AsInt64    :=FidReport;



                         UpdateSp.ExecProc;
                         id_record:=UpdateSp.ParamByName('ID_RECORD').AsInt64;
                         WriteTransaction.Commit;

                         DataSet6.CloseOpen(false);
                         DataSet6.Locate('id_record',id_record,[]);

                         UpdateSp.Close;
                         UpdateSp.Free;
               end;
               T.Free;
     end;

     if (PageControl1.ActivePageIndex=1)
     then begin
               F:=TfrmTable6RowNew.Create(self, WorkDatabase.Handle);
               f.Label3.Caption:=Col12.Caption;
               f.Label4.Caption:=Col13.Caption;
               f.Label5.Caption:=Col14.Caption;

               if not(ActualDate<=StrToDate('31.12.2010'))
               then begin
                         f.DBLookupComboBox1.visible:=True;
                         f.DBLookupComboBox1.ListSource:=TypeStavkaDataSource;
                         f.DBLookupComboBox1.ListField:='text_visible';
                         f.DBLookupComboBox1.KeyField:='type_stavka';
                         f.col9.Visible:=false;
               end;

               F.col6_7.Enabled:=True;
               F.col10.Date:=StartOfTheMonth(date);
               if F.ShowModal=mrYes
               then begin
                         UpdateSp:=TpFIBStoredProc.Create(self);
                         UpdateSp.Database:=WorkDatabase;
                         UpdateSp.Transaction:=WriteTransaction;
                         WriteTransaction.StartTransaction;
                         UpdateSp.StoredProcName:='Z_PERSON7_INS';
                         UpdateSp.Prepare;

                         UpdateSp.ParamByName('KOD_CATEGORII').Value  :=F.col8.Text;

                         if ActualDate<=StrToDate('31.12.2010')
                         then begin
                                   UpdateSp.ParamByName('TYPE_STAVKA').Value    :=F.col9.Text;
                                   UpdateSp.ParamByName('NUM_CD_HOSP').Value    :=f.cxSpinEdit1.Value;
                                   UpdateSp.ParamByName('NUM_CD_NOT_ZAR').Value :=f.cxSpinEdit2.Value;
                                   UpdateSp.ParamByName('NUM_CD_WORK').Value    :=f.cxSpinEdit3.Value;
                         end
                         else begin
                                   UpdateSp.ParamByName('TYPE_STAVKA').Value    :=f.DBLookupComboBox1.KeyValue;
                                   UpdateSp.ParamByName('NUM_CD_HOSP').Value    :=f.cxSpinEdit1.Value;
                                   UpdateSp.ParamByName('NUM_CD_NOT_ZAR').Value    :=f.cxSpinEdit2.Value;
                                   UpdateSp.ParamByName('NUM_CD_WORK').Value    :=f.cxSpinEdit3.Value;
                         end;

                         UpdateSp.ParamByName('TYPE_NARAH').Value     :=F.col11.EditValue;
                         UpdateSp.ParamByName('KOD_SETUP_O2D').Value  :=F.col10.EditValue;
                         UpdateSp.ParamByName('SUMMA_ZAR').Value      :=F.col12.EditValue;
                         UpdateSp.ParamByName('SUMMA_ZAR_LIMIT').Value:=F.col13.EditValue;
                         UpdateSp.ParamByName('SUMMA_VZNOS').Value    :=F.col14.EditValue;
                         UpdateSp.ParamByName('OZN_WORK').Value       :=Integer(F.col15.Checked);
                         UpdateSp.ParamByName('IS_SCIENCE').Value     :=Integer(F.col16.Checked);
                         UpdateSp.ParamByName('OZN_NEW_WORK_PL').Value:=Integer(F.cxCheckBoxOZN_NEW_WORK_PL.Checked);


                         if  F.MENUM_CD_DEKRET.text<>'' then
                         UpdateSp.ParamByName('NUM_CD_DEKRET').Value  :=F.MENUM_CD_DEKRET.EditValue;

                         UpdateSp.ParamByName('id_man').asint64       :=F.FIdman;
                         UpdateSp.ParamByName('ID_REPORT').AsInt64    :=FidReport;

                         UpdateSp.ExecProc;
                         id_record:=UpdateSp.ParamByName('ID_RECORD').AsInt64;
                         
                         WriteTransaction.Commit;

                         DataSet7.CloseOpen(false);
                         DataSet7.Locate('id_record',id_record,[]);

                         UpdateSp.Close;
                         UpdateSp.Free;
               end;
               F.Free;
     end;
end;

procedure TfrmZPersModule1.dxBarLargeButton1Click(Sender: TObject);
var T:TfrmTable6Row;
    F:TfrmTable6RowNew;
    UpdateSp:TpFIBStoredProc;
    id_record:Variant;
begin
               if (PageControl1.ActivePageIndex=0)
               then begin
                         if DataSet6.RecordCount>0
                         then begin
                                   T:=TfrmTable6Row.Create(self, WorkDatabase.Handle);
                                   T.col6_7.Text                  :=DataSet6.FieldByName('col6').AsString+' '+DataSet6.FieldByName('col7').AsString;
                                   T.col8.Text                    :=DataSet6.FieldByName('col8').Value;
                                   T.col9.Text                    :=DataSet6.FieldByName('col9').Value;
                                   T.col10.EditValue              :=DataSet6.FieldByName('col10').Value;
                                   T.col11.EditValue              :=DataSet6.FieldByName('col11').Value;
                                   T.col12.EditValue              :=DataSet6.FieldByName('col12').Value;
                                   T.col13.Checked                :=DataSet6.FieldByName('col13').Value;
                                   T.col14.Checked                :=DataSet6.FieldByName('col14').Value;
                                   


                                   if T.ShowModal=mrYes
                                   then begin
                                             UpdateSp:=TpFIBStoredProc.Create(self);
                                             UpdateSp.Database:=WorkDatabase;
                                             UpdateSp.Transaction:=WriteTransaction;
                                             WriteTransaction.StartTransaction;
                                             UpdateSp.StoredProcName:='Z_PERSON6_UPD';
                                             UpdateSp.Prepare;
                                             id_record:=DataSet6.FieldByName('ID_RECORD').Value;
                                             UpdateSp.ParamByName('ID_RECORD').Value      :=DataSet6.FieldByName('ID_RECORD').Value;
                                             UpdateSp.ParamByName('KOD_CATEGORII').Value  :=T.col8.Text;
                                             UpdateSp.ParamByName('TYPE_STAVKA').Value    :=T.col9.Text;
                                             UpdateSp.ParamByName('SUMMA_ZAR').Value      :=T.col10.EditValue;
                                             UpdateSp.ParamByName('SUMMA_ZAR_LIMIT').Value:=T.col11.EditValue;
                                             UpdateSp.ParamByName('SUMMA_VZNOS').Value    :=T.col12.EditValue;
                                             UpdateSp.ParamByName('OZN_WORK').Value       :=Integer(T.col13.Checked);
                                             UpdateSp.ParamByName('IS_SCIENCE').Value     :=Integer(T.col14.Checked);



                                             UpdateSp.ExecProc;
                                             WriteTransaction.Commit;

                                             DataSet6.CloseOpen(false);
                                             DataSet6.Locate('id_record',id_record,[]);

                                             UpdateSp.Close;
                                             UpdateSp.Free;
                                   end;
                                   T.Free;
                         end;
               end;

               if (PageControl1.ActivePageIndex=1)
               then begin
                         if DataSet7.RecordCount>0
                         then begin
                                   F:=TfrmTable6RowNew.Create(self, WorkDatabase.Handle);
                                   f.Label3.Caption:=Col12.Caption;
                                   f.Label4.Caption:=Col13.Caption;
                                   f.Label5.Caption:=Col14.Caption;

                                   if not(ActualDate<=StrToDate('31.12.2010'))
                                   then begin
                                             f.DBLookupComboBox1.visible:=True;
                                             f.DBLookupComboBox1.ListSource:=TypeStavkaDataSource;
                                             f.DBLookupComboBox1.ListField:='text_visible';
                                             f.DBLookupComboBox1.KeyField:='type_stavka';
                                             f.col9.Visible:=false;
                                             f.DBLookupComboBox1.keyvalue:=DataSet7.FieldByName('col9').Value;
                                             f.cxSpinEdit1.Value:=DataSet7.FieldByName('NUM_CD_HOSP').Value;
                                             f.cxSpinEdit2.Value:=DataSet7.FieldByName('NUM_CD_NOT_ZAR').Value;
                                             f.cxSpinEdit3.Value:=DataSet7.FieldByName('NUM_CD_WORK').Value;

                                   end;

                                   F.col6_7.Text    :=DataSet7.FieldByName('col6').AsString+' '+DataSet7.FieldByName('col7').AsString;
                                   F.col8.Text      :=DataSet7.FieldByName('col8').Value;

                                   F.col9.Text      :=varToStrDef(DataSet7.FieldByName('col9').Value,'');
                                   F.col10.EditValue:=DataSet7.FieldByName('col10').Value;
                                   F.col11.EditValue:=DataSet7.FieldByName('col11').Value;
                                   F.col12.EditValue:=DataSet7.FieldByName('col12').Value;
                                   F.col13.EditValue:=DataSet7.FieldByName('col13').Value;
                                   F.col14.EditValue:=DataSet7.FieldByName('col14').Value;
                                   F.col15.Checked  :=DataSet7.FieldByName('col15').Value;
                                   F.col16.Checked  :=DataSet7.FieldByName('col16').Value;
                                   if DataSet7.FieldByName('OZN_NEW_WORK_PL').Value<>null then
                                   F.cxCheckBoxOZN_NEW_WORK_PL.Checked := DataSet7.FieldByName('OZN_NEW_WORK_PL').Value;

                                   F.MENUM_CD_DEKRET.EditValue    :=DataSet7.FieldByName('NUM_CD_DEKRET').Value;

                                   if F.ShowModal=mrYes
                                   then begin
                                             UpdateSp:=TpFIBStoredProc.Create(self);
                                             UpdateSp.Database:=WorkDatabase;
                                             UpdateSp.Transaction:=WriteTransaction;
                                             WriteTransaction.StartTransaction;
                                             UpdateSp.StoredProcName:='Z_PERSON7_UPD';
                                             UpdateSp.Prepare;
                                             id_record:=DataSet7.FieldByName('ID_RECORD').Value;
                                             UpdateSp.ParamByName('ID_RECORD').Value      :=DataSet7.FieldByName('ID_RECORD').Value;
                                             UpdateSp.ParamByName('KOD_CATEGORII').Value  :=F.col8.Text;


                                             if ActualDate<=StrToDate('31.12.2010')
                                             then begin
                                                       UpdateSp.ParamByName('TYPE_STAVKA').Value    :=F.col9.Text;
                                                       UpdateSp.ParamByName('NUM_CD_HOSP').Value    :=NULL;
                                                       UpdateSp.ParamByName('NUM_CD_NOT_ZAR').Value :=NULL;
                                                       UpdateSp.ParamByName('NUM_CD_WORK').Value    :=NULL;
                                             end
                                             else begin
                                                       UpdateSp.ParamByName('TYPE_STAVKA').Value    :=f.DBLookupComboBox1.KeyValue;
                                                       UpdateSp.ParamByName('NUM_CD_HOSP').Value    :=f.cxSpinEdit1.Value;
                                                       UpdateSp.ParamByName('NUM_CD_NOT_ZAR').Value :=f.cxSpinEdit2.Value;
                                                       UpdateSp.ParamByName('NUM_CD_WORK').Value    :=f.cxSpinEdit3.Value;
                                             end;

                                             UpdateSp.ParamByName('TYPE_NARAH').Value     :=F.col11.EditValue;
                                             UpdateSp.ParamByName('KOD_SETUP_O2D').Value  :=F.col10.EditValue;
                                             UpdateSp.ParamByName('SUMMA_ZAR').Value      :=F.col12.EditValue;
                                             UpdateSp.ParamByName('SUMMA_ZAR_LIMIT').Value:=F.col13.EditValue;
                                             UpdateSp.ParamByName('SUMMA_VZNOS').Value    :=F.col14.EditValue;
                                             UpdateSp.ParamByName('OZN_WORK').Value       :=Integer(F.col15.Checked);
                                             UpdateSp.ParamByName('IS_SCIENCE').Value     :=Integer(F.col16.Checked);
                                             UpdateSp.ParamByName('OZN_NEW_WORK_PL').Value:=Integer(F.cxCheckBoxOZN_NEW_WORK_PL.Checked);

                                             UpdateSp.ParamByName('NUM_CD_DEKRET').Value  :=F.MENUM_CD_DEKRET.EditValue;

                                             UpdateSp.ExecProc;
                                             WriteTransaction.Commit;

                                             DataSet7.CloseOpen(false);
                                             DataSet7.Locate('id_record',id_record,[]);

                                             UpdateSp.Close;
                                             UpdateSp.Free;
                                   end;
                                   F.Free;
                         end;          
               end;
end;

procedure TfrmZPersModule1.DelReportBtnClick(Sender: TObject);
var DeleSP:TpFIBStoredProc;
begin
     if PageControl1.ActivePageIndex=0
     then begin
               if DataSet6.RecordCount>0
               then begin
                         if Application.MessageBox('Ви хочете видалити запис?', 'Увага!',
                           MB_YESNO + MB_ICONQUESTION) = IDYES then
                         begin
                               DeleSP:=TpFIBStoredProc.Create(self);
                               DeleSP.Database:=WorkDatabase;
                               DeleSP.Transaction:=WriteTransaction;
                               WriteTransaction.StartTransaction;
                               DeleSP.StoredProcName:='Z_PERSON6__DEL';
                               DeleSP.Prepare;
                               DeleSP.ParamByName('ID_RECORD').Value:=DataSet6.FieldByName('ID_RECORD').Value;
                               DeleSP.ExecProc;
                               WriteTransaction.Commit;
                               DeleSP.Close;
                               DeleSP.Free;
                               DataSet6.CacheDelete;
                         end;
               end
     end;

     if PageControl1.ActivePageIndex=1
     then begin
               if DataSet7.RecordCount>0
               then begin
                         if Application.MessageBox('Ви хочете видалити запис?', 'Увага!',
                           MB_YESNO + MB_ICONQUESTION) = IDYES then
                         begin
                               DeleSP:=TpFIBStoredProc.Create(self);
                               DeleSP.Database:=WorkDatabase;
                               DeleSP.Transaction:=WriteTransaction;
                               WriteTransaction.StartTransaction;
                               DeleSP.StoredProcName:='Z_PERSON7__DEL';
                               DeleSP.Prepare;
                               DeleSP.ParamByName('ID_RECORD').Value:=DataSet7.FieldByName('ID_RECORD').Value;
                               DeleSP.ExecProc;
                               WriteTransaction.Commit;
                               DeleSP.Close;
                               DeleSP.Free;
                               DataSet7.CacheDelete;
                         end;
               end
     end;
end;

procedure TfrmZPersModule1.GetPeriodsListBox;
var ItemsDs:TpFIBDataSet;
    i:Integer;
    ks:Integer;
    ek:Boolean;
begin
     PeriodsCB.Items.Clear;
     PeriodsCB.Clear;
     ek:=False;

     ItemsDs               :=TpFIBDataSet.Create(self);
     ItemsDs.Database      :=WorkDatabase;
     ItemsDs.Transaction   :=ReadTransaction;
     ItemsDs.SelectSQL.Text:='SELECT * FROM Z_PERS_GET_SETUPS_BY_REPORT67('+IntToStr(Self.FidReport)+')';
     ItemsDs.Open;
     ItemsDs.FetchAll;
     ItemsDs.First;
     for i:=0 to ItemsDs.RecordCount-1 do
     begin
          ks:=ItemsDs.FieldByName('kod_setup').Value;
          PeriodsCB.Items.AddObject(ItemsDs.FieldByName('kod_setup_string').AsString,TObject(ks));
          if ks=Self.FKodSetup
          then begin
                    PeriodsCB.ItemIndex:=i;
                    ek:=true;
          end;

          ItemsDs.Next;
     end;

     if not ek
     then PeriodsCB.ItemIndex:=0;

     ItemsDs.Close;
     ItemsDs.Free;
end;




end.


