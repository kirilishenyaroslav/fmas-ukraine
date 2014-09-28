unit uExperFrame;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridTableView, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGridCustomTableView, EditControl,
  cxGridDBTableView, cxGrid, uExperDataModule, Buttons, ExtCtrls,
  ActnList, ComCtrls, FieldControl, SpComboBox, uCommonSp, SpCommon, Mask,
  CheckEditUnit, cxContainer, cxLabel, cxDBLabel, uExperAdd, uFormControl,
  DBCtrls, cxTextEdit, cxSplitter, cxMaskEdit, cxButtonEdit, cxCheckBox,
  uHistExper, FIBDataSet, pFIBDataSet, cxDropDownEdit, cxCalendar,
  uFControl, uLabeledFControl, uDateControl,pFIBStoredProc;

type
  TfmPCardExperPage = class(TFrame)
    Panel11: TPanel;
    SB_AddExper: TSpeedButton;
    ALExper: TActionList;
    AddExperA: TAction;
    ModifExperA: TAction;
    ExperGridDBTableView1: TcxGridDBTableView;
    ExperGridLevel1: TcxGridLevel;
    ExperGrid: TcxGrid;
    cxStyleRepository1: TcxStyleRepository;
    SB_DelExper: TSpeedButton;
    DS_Exper: TDataSource;
    ExperGridDBTableView1DBColumn1: TcxGridDBColumn;
    ExperGridDBTableView1DBColumn2: TcxGridDBColumn;
    ExperGridDBTableView1DBColumn4: TcxGridDBColumn;
    Panel1: TPanel;
    DelExperA: TAction;
    SB_ModifExper: TSpeedButton;
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
    cxGridTableViewStyleSheet1: TcxGridTableViewStyleSheet;
    ExperGridDBTableView1DBColumn3: TcxGridDBColumn;
    ExperGridDBTableView1DBColumn5: TcxGridDBColumn;
    ExperGridDBTableView1DBColumn6: TcxGridDBColumn;
    ExperGridDBTableView1DBColumn7: TcxGridDBColumn;
    cxGrid1: TcxGrid;
    OView: TcxGridDBTableView;
    OViewVid: TcxGridDBColumn;
    cxGridDBNumOrder: TcxGridDBColumn;
    cxGridDBDateOrder: TcxGridDBColumn;
    OViewNumProject: TcxGridDBColumn;
    OViewDateProject: TcxGridDBColumn;
    cxGridDBPercent: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    OViewDBDateBegin: TcxGridDBColumn;
    OViewDBDateAppointment: TcxGridDBColumn;
    cxSplitter1: TcxSplitter;
    OViewDBDateEnd: TcxGridDBColumn;
    DS_Order: TDataSource;
    Panel2: TPanel;
    cxCheckBox5: TcxCheckBox;
    LevelEdit: TcxButtonEdit;
    cxCheckBox1: TcxCheckBox;
    SB_HistExper: TSpeedButton;
    HistExperA: TAction;
    cxCheckBox2: TcxCheckBox;
    Panel3: TPanel;
    LblExperDate: TcxLabel;
    ActDate: TcxDateEdit;
    ExperGridDBTableView1DBColumn8: TcxGridDBColumn;
    ExperGridDBTableView1DBColumn9: TcxGridDBColumn;
    ExperGridDBTableView1DBColumn10: TcxGridDBColumn;
    SpeedButton1: TSpeedButton;
    BtnViewCalcStaj: TSpeedButton;
    ViewStajA: TAction;
    btnManCalcStaj: TSpeedButton;
    procedure AddExperAExecute(Sender: TObject);
    procedure DelExperAExecute(Sender: TObject);
    procedure FrameExit(Sender: TObject);
    procedure FrameEnter(Sender: TObject);
    procedure ExperGridDBTableView1KeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure ModifExperAExecute(Sender: TObject);
    procedure OViewKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxCheckBox5PropertiesChange(Sender: TObject);
    procedure LevelEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxCheckBox1PropertiesChange(Sender: TObject);
    procedure HistExperAExecute(Sender: TObject);
    procedure cxCheckBox2PropertiesChange(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure ViewStajAExecute(Sender: TObject);
    procedure btnManCalcStajClick(Sender: TObject);
  private
    { Private declarations }
  public
    DM : TdmExper;
    id_pcard, IdMan : integer;
    actual_date : TDate;
    id_level : integer;
    constructor Create(AOwner: TComponent; DMod: TdmExper; Id_PC: Integer; modify :integer; act_date:Tdate); reintroduce;
  end;

implementation

uses FIBDatabase, uUnivSprav, RxmemDs, UpKernelUnit,accmgmt, WinSock, uPersonStajMan,
     uManCalcStajInfo;

{$R *.dfm}

constructor TfmPCardExperPage.Create(AOwner: TComponent; DMod: TdmExper; Id_PC: Integer; modify :integer; act_date:Tdate);
var tv: string;
    DefLevevInfoDS:TpFIBDataSet;
begin
    inherited Create(AOwner);
    DM:=Dmod; id_pcard:=Id_PC;
    actual_date:=act_date;
    Dm.ReadTransaction.StartTransaction;
    Dm.DefaultTransaction.StartTransaction;
    //StartHistory(Dm.DefaultTransaction);
    DS_Exper.DataSet:=DM.ExperSelect;
    if DM.ExperSelect.Active then DM.ExperSelect.Close;
    DM.ExperSelect.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM PRIVATE_CARDS PC WHERE PC.ID_PCARD=:ID_PCARD';
    Dm.ExperSelect.ParamByName('ID_PCARD').AsInteger:=id_pcard;
    DM.ExperSelect.Open;
    IdMan:=DM.ExperSelect['ID_MAN'];

    if DM.ExperSelect.Active then DM.ExperSelect.Close;
    DM.ExperSelect.SelectSQL.Text:='SELECT * FROM UP_KER_MAN_STAJ_S(:Id_PCard,:ACTUAL_DATE, :ID_LEVEL)';
    DM.ExperSelect.ParamByName('Id_PCard').AsInteger := Id_PCard;
    DM.ExperSelect.ParamByName('ACTUAL_DATE').AsDate := act_date;
    if LevelEdit.Enabled then
    DM.ExperSelect.ParamByName('ID_LEVEL').AsInteger := id_level
    else
    DM.ExperSelect.ParamByName('ID_LEVEL').Value := Null;
    DM.ExperSelect.Open;
    if (modify=0) then
     begin
       Panel11.Enabled:=False;
       ModifExperA.Enabled:=False;
       AddExperA.Enabled:=False;
       DelExperA.Enabled:=False;
       HistExperA.Enabled:=False;
     end;
     DM.OrderDataSet.Close;
     DS_Order.DataSet:=DM.OrderDataSet;
     DM.OrderDataSet.SelectSQL.Text:='SELECT * FROM UP_KER_GET_STAJ(?ID_PCARD,?Act_Date,?ID_LEVEL) order by ID_STAJ, PERCENT_STR';
     DM.OrderDataSet.ParamByName('ID_PCARD').AsInteger := id_pcard;
     DM.OrderDataSet.ParamByName('Act_date').AsDate:=actual_date;
     DM.OrderDataSet.ParamByName('ID_LEVEL').Value     :=null;
     ActDate.date:=act_date;
    tv:='';
    tv:=KYVLoadFromRegistry('TfmPCardExperPage_cxCheckBox1',GetUserId);
    if (tv='0') or (tv='1')
    then begin
             cxCheckBox1.Checked:=Boolean(StrToInt(tv));
             cxCheckBox1.Properties.OnChange(Self);
    end;

    tv:='';
    tv:=KYVLoadFromRegistry('TfmPCardExperPage_cxCheckBox2',GetUserId);
    if (tv='0') or (tv='1')
    then begin
             cxCheckBox2.Checked:=Boolean(StrToInt(tv));
             cxCheckBox2.Properties.OnChange(Self);
    end;

    tv:='';
    tv:=KYVLoadFromRegistry('TfmPCardExperPage_cxCheckBox5',GetUserId);
    if (tv='0') or (tv='1')
    then begin
             cxCheckBox5.Checked:=Boolean(StrToInt(tv));
             cxCheckBox5.Properties.OnChange(Self);
    end;
    
    DefLevevInfoDS:=TpFIBDataSet.Create(self);
    DefLevevInfoDS.Database:=DM.DB;
    DefLevevInfoDS.Transaction:=Dm.ReadTransaction;
    DefLevevInfoDS.SelectSQL.Text:='SELECT * FROM UP_KER_UTIL_GET_DEF_LEVEL';
    DefLevevInfoDS.Open;
    if (DefLevevInfoDS.RecordCount>0)
    then begin
              LevelEdit.Text:=DefLevevInfoDS.FieldByName('LEVEL_NAME').AsString;
              id_level:=DefLevevInfoDS.FieldByName('ID_LEVEL').Value;
    end;
    DefLevevInfoDS.Close;
    DefLevevInfoDS.Free;

end;

procedure TfmPCardExperPage.AddExperAExecute(Sender: TObject);
var ExperForm: TExperForm;
begin
    ExperForm := TExperForm.Create(DM,fmAdd,Null,id_pcard);
    ExperForm.Caption := 'Додати ' + ExperForm.Caption;
    If ExperForm.ShowModal = mrOk Then
        Begin
            with DM do
            begin
                StorProc.Transaction.StartTransaction;
                StorProc.StoredProcName := 'ASUP_MAN_STAJ_INS';
                StorProc.Prepare;
                StorProc.ParamByName('ID_MAN').AsInt64 := IdMan;
                StorProc.ParamByName('ID_STAJ').AsInteger := ExperForm.qFSC_Type.Value;
                StorProc.ParamByName('ID_PERSON_DOCUMENT').Value := Null;
                StorProc.ParamByName('DATE_CALC').AsDate := ExperForm.qFDC_DBeg.Value;
                StorProc.ParamByName('CALC_DAYS').AsShort := ExperForm.qFIC_Day.Value;
                StorProc.ParamByName('CALC_MONTH').AsShort := ExperForm.qFIC_Month.Value;
                StorProc.ParamByName('CALC_YEARS').AsShort := ExperForm.qFIC_Years.Value;
                StorProc.ParamByName('NOTE').AsString  := 'Додано користувачем';
                StorProc.ParamByName('ADD_FLAG').AsShort := 0;
                if ExperForm.qFBC_Recalc.Checked then StorProc.ParamByName('RECALC').AsString := 'T'
                else StorProc.ParamByName('RECALC').AsString := 'F';
                try
                  StorProc.ExecProc;
                  StorProc.Transaction.Commit;
                  ExperSelect.Close;
                  ExperSelect.Open;
                  OrderDataSet.Close;
                  OrderDataSet.Open;
                except on E:Exception do
                       begin
                          ShowMessage(E.Message);
                          StorProc.Transaction.Rollback;
                       end;
                end;
            end;
        End;
    ExperForm.Free;

 { ExperForm:=TExperForm.Create(DM,fmAdd,Null,id_pcard);
  if (ExperForm.ShowModal=mrOk) then
   begin
     DM.ExperSelect.Close;
     DM.ExperSelect.Open;
     DM.OrderDataSet.Close;
     DM.OrderDataSet.Open;
   end; }
end;

procedure TfmPCardExperPage.DelExperAExecute(Sender: TObject);
begin
  with DM do
  begin
    If ExperSelect.IsEmpty then
     begin
       MessageDlg('Не можливо видалити пустий запис!',mtError,[mbYes],0);
       Exit;
     end;
    if (MessageDlg('Чи ви справді бажаєте вилучити цей запис?',mtConfirmation,[mbYes,mbNo],0) = mrNo) then Exit;
    try
      DefaultTransaction.StartTransaction;
      //StartHistory(DefaultTransaction);
      DeleteQ.ParamByName('ID_MAN').AsInteger:=ExperSelect['Id_man'];
      DeleteQ.ParamByName('ID_STAJ').AsInteger:=ExperSelect['Id_Staj'];
      DeleteQ.ExecProc;
      DefaultTransaction.Commit;
      ExperSelect.Close;
      ExperSelect.Open;
      OrderDataSet.Close;
      OrderDataSet.Open;
    except on e: Exception do
     begin
       MessageDlg('Не вдалося видалити запис: '+#13+e.Message,mtError,[mbYes],0);
       DefaultTransaction.Rollback;
     end;
    end;
  end;
end;

procedure TfmPCardExperPage.FrameExit(Sender: TObject);
begin
  //DM.ReadTransaction.Commit;
end;

procedure TfmPCardExperPage.FrameEnter(Sender: TObject);
begin
 { DM.ReadTransaction.StartTransaction;
  DM.ExperSelect.Close;
  DM.ExperSelect.Open;   }
end;

procedure TfmPCardExperPage.ExperGridDBTableView1KeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (( Key = VK_F12) and (ssShift in Shift)) then
   ShowInfo(ExperGridDBTableView1.DataController.DataSource.DataSet);
end;

procedure TfmPCardExperPage.ModifExperAExecute(Sender: TObject);
begin
  If DM.ExperSelect.IsEmpty then
   begin
     MessageDlg('Не можливо змінити пустий запис!',mtError,[mbYes],0);
     Exit;
   end;

    //ExperForm:=TExperForm.Create(DM,fmModify,DM.ExperSelect['id_man_staj'],id_pcard);

    ExperForm:=TExperForm.Create(DM,fmModify,DM.ExperSelect['id_man_staj'],id_pcard);
    ExperForm.Caption := 'Змінити ' + ExperForm.Caption;
    ExperForm.qFSC_Type.Value :=       Dm.ExperSelect['ID_STAJ'];
    ExperForm.qFSC_Type.DisplayText := Dm.ExperSelect['NAME_STAJ'];
    ExperForm.qFDC_DBeg.Value :=       Dm.ExperSelect['DATE_CALC'];
    If Dm.ExperSelect['RECALC']='T' then
    ExperForm.qFBC_Recalc.Checked := True
    else
    ExperForm.qFBC_Recalc.Checked := False;
    ExperForm.qFIC_Years.Value :=       Dm.ExperSelect['CALC_YEARS'];
    ExperForm.qFIC_Month.Value :=       Dm.ExperSelect['CALC_MONTH'];
    ExperForm.qFIC_Day.Value  :=       Dm.ExperSelect['CALC_DAYS'];

    If ExperForm.ShowModal = mrOk Then
        Begin
            with DM do
            begin
                StorProc.Transaction.StartTransaction;
                StorProc.StoredProcName := 'ASUP_MAN_STAJ_INS';
                StorProc.Prepare;
                StorProc.ParamByName('ID_MAN').AsInt64 := DM.ExperSelect['Id_Man'];
                StorProc.ParamByName('ID_STAJ').AsInteger := ExperForm.qFSC_Type.Value;
                StorProc.ParamByName('ID_PERSON_DOCUMENT').Value := Null;
                StorProc.ParamByName('DATE_CALC').AsDate := ExperForm.qFDC_DBeg.Value;
                StorProc.ParamByName('CALC_DAYS').AsShort := ExperForm.qFIC_Day.Value;
                StorProc.ParamByName('CALC_MONTH').AsShort := ExperForm.qFIC_Month.Value;
                StorProc.ParamByName('CALC_YEARS').AsShort := ExperForm.qFIC_Years.Value;
                StorProc.ParamByName('NOTE').AsString  := 'Додано користувачем';
                StorProc.ParamByName('ADD_FLAG').AsShort := 0;
                if ExperForm.qFBC_Recalc.Checked then StorProc.ParamByName('RECALC').AsString := 'T'
                else StorProc.ParamByName('RECALC').AsString := 'F';
                try
                  StorProc.ExecProc;
                  StorProc.Transaction.Commit;
                  ExperSelect.Close;
                  ExperSelect.Open;
                  OrderDataSet.Close;
                  OrderDataSet.Open;
                except on E:Exception do
                      begin
                         ShowMessage(E.Message);
                         StorProc.Transaction.Rollback;
                      end;
                end;
            end;
        End;
    ExperForm.Free;
end;

procedure TfmPCardExperPage.OViewKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (( Key = VK_F12) and (ssShift in Shift)) then
   ShowInfo(OView.DataController.DataSource.DataSet);
end;

procedure TfmPCardExperPage.cxCheckBox5PropertiesChange(Sender: TObject);
begin
    LevelEdit.Enabled:=cxCheckBox5.Checked;

    Screen.Cursor:=crHourGlass;
    DM.OrderDataSet.Close;
    DM.OrderDataSet.ParamByName('Id_PCard').AsInteger := Id_PCard;

    if not cxCheckBox1.Checked
    then begin
              DM.OrderDataSet.ParamByName('Act_date').AsDate    :=actual_date;
    end
    else begin
              DM.OrderDataSet.ParamByName('Act_date').Value     :=null;
    end;

    if cxCheckBox5.Checked
    then DM.OrderDataSet.ParamByName('ID_LEVEL').Value     :=id_level
    else DM.OrderDataSet.ParamByName('ID_LEVEL').Value     :=null;

    DM.OrderDataSet.Open;

    Screen.Cursor:=crDefault;
    KYVSaveIntoRegistry('TfmPCardExperPage_cxCheckBox5',IntToStr(Integer(cxCheckBox5.Checked)),GetUserId);
end;

procedure TfmPCardExperPage.LevelEditPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
      Params:TUnivParams;
      OutPut : TRxMemoryData;
begin

    Params.FormCaption:='Довідник рівнів актуальності';
    Params.ShowMode:=fsmSelect;
    Params.ShowButtons:=[fbExit];
    Params.TableName:='UP_SYS_LEVEL';
    Params.Fields:='LEVEL_ORDER,LEVEL_NAME,ID_LEVEL';
    Params.FieldsName:='Порядок,Назва';
    Params.KeyField:='ID_LEVEL';
    Params.ReturnFields:='LEVEL_ORDER,LEVEL_NAME,ID_LEVEL';
    Params.DBHandle:=Integer(Dm.DB.Handle);

    OutPut:=TRxMemoryData.Create(self);

    if GetUnivSprav(Params,OutPut)
    then begin
              id_level:=output['ID_LEVEL'];
              LevelEdit.Text:=VarToStr(output['LEVEL_NAME']);

              Screen.Cursor:=crHourGlass;
              if DM.OrderDataSet.Active then Dm.OrderDataSet.Close;
              DM.OrderDataSet.ParamByName('Id_PCard').AsInteger :=Id_PCard;
              if not cxCheckBox1.Checked
              then begin
                        DM.OrderDataSet.ParamByName('Act_date').AsDate    :=actual_date;
              end
              else begin
                        DM.OrderDataSet.ParamByName('Act_date').Value     :=null;
              end;

              if cxCheckBox5.Checked
              then DM.OrderDataSet.ParamByName('ID_LEVEL').Value     :=id_level
              else DM.OrderDataSet.ParamByName('ID_LEVEL').Value     :=null;

              DM.OrderDataSet.Open;

              Screen.Cursor:=crDefault;
    end;
end;

procedure TfmPCardExperPage.cxCheckBox1PropertiesChange(Sender: TObject);
begin
    Screen.Cursor:=crHourGlass;

    if DM.OrderDataSet.Active then DM.OrderDataSet.Close;

    DM.OrderDataSet.ParamByName('Id_PCard').AsInteger :=Id_PCard;

    if not cxCheckBox1.Checked
    then begin
              DM.OrderDataSet.ParamByName('Act_date').AsDate:=actual_date;
    end
    else begin
              DM.OrderDataSet.ParamByName('Act_date').Value :=null;
    end;

    DM.OrderDataSet.Open;

    Screen.Cursor:=crDefault;

    KYVSaveIntoRegistry('TfmPCardExperPage_cxCheckBox1',IntToStr(Integer(cxCheckBox1.Checked)),GetUserId);
end;

procedure TfmPCardExperPage.HistExperAExecute(Sender: TObject);
var HistExperForm: TfmHistExper;
begin
  HistExperForm:=TfmHistExper.Create(DM,id_pcard, DM.ExperSelect['Id_Staj']);
  HistExperForm.ShowModal;
  HistExperForm.Free;
end;

procedure TfmPCardExperPage.cxCheckBox2PropertiesChange(Sender: TObject);
begin

     Panel3.Visible:=cxCheckBox2.Checked;
     cxSplitter1.Visible:=cxCheckBox2.Checked;

     if cxCheckBox2.Checked
     then begin
            cxSplitter1.Top:=Panel3.Top-1;

            if DM.OrderDataSet.Active then DM.OrderDataSet.Close;

            DM.OrderDataSet.ParamByName('Id_PCard').AsInteger :=Id_PCard;
            if not cxCheckBox1.Checked
            then begin
                DM.OrderDataSet.ParamByName('Act_date').AsDate:=actual_date;
            end
            else begin
                DM.OrderDataSet.ParamByName('Act_date').Value :=null;
            end;
            if cxCheckBox5.Checked
            then DM.OrderDataSet.ParamByName('ID_LEVEL').Value     :=id_level
            else DM.OrderDataSet.ParamByName('ID_LEVEL').Value     :=null;
            DM.OrderDataSet.Open;

     end;

     KYVSaveIntoRegistry('TfmPCardExperPage_cxCheckBox2',IntToStr(Integer(cxCheckBox2.Checked)),GetUserId);

end;

procedure TfmPCardExperPage.SpeedButton1Click(Sender: TObject);
begin
    DM.ExperSelect.Close;
    DM.ExperSelect.SelectSQL.Text:='SELECT * FROM UP_KER_MAN_STAJ_S(:Id_PCard,:ACTUAL_DATE, :ID_LEVEL)';
    DM.ExperSelect.ParamByName('Id_PCard').AsInteger := Id_PCard;
    DM.ExperSelect.ParamByName('ACTUAL_DATE').AsDate := ActDate.Date;
    if LevelEdit.Enabled then
    DM.ExperSelect.ParamByName('ID_LEVEL').AsInteger := id_level
    else
    DM.ExperSelect.ParamByName('ID_LEVEL').Value := Null;
    DM.ExperSelect.Open;
    DM.OrderDataSet.Close;
    DM.OrderDataSet.SelectSQL.Text:='SELECT * FROM UP_KER_GET_STAJ(?ID_PCARD,?Act_Date,?ID_LEVEL) order by ID_STAJ, PERCENT_STR';
    DM.OrderDataSet.ParamByName('ID_PCARD').AsInteger := id_pcard;
    DM.OrderDataSet.ParamByName('Act_date').AsDate:=ActDate.Date;
    DM.OrderDataSet.ParamByName('ID_LEVEL').Value     :=null;
    DM.OrderDataSet.Open;
end;

procedure TfmPCardExperPage.ViewStajAExecute(Sender: TObject);
var frm:TfrmPersonStaj;
begin
    frm:=TfrmPersonStaj.Create(Self, id_pcard);
    frm.ShowModal;
    frm.Free;
end;

procedure TfmPCardExperPage.btnManCalcStajClick(Sender: TObject);
var frm:TfrmManCalcStajInfo;
begin
  try
    frm:=TfrmManCalcStajInfo.Create(Self, DM, Dm.ExperSelect['ID_MAN'], DM.ExperSelect['ID_STAJ']);
    frm.ShowModal;
    frm.Free;
  except on E:Exception
         do begin
              ShowMessage(E.Message);
         end;
  end;
end;

end.
