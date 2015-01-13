unit ManHospControl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, cxButtonEdit, cxMaskEdit, cxDropDownEdit, cxTextEdit,
  cxContainer, cxEdit, cxLabel, cxControls, cxGroupBox,
  cxLookAndFeelPainters, ActnList, StdCtrls, cxButtons, cxCalendar,PackageLoad, Ztypes,
  ManHospControlDm, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, DB, cxDBData, ExtCtrls, cxMemo, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGridCustomView, cxGrid, cxClasses, cxSpinEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, FIBDataSet, pFIBDataSet, ManHospSelect, DateUtils,
  RxMemDS, ManHospExceptDates,unit_ZGlobal_consts, ZProc, ZMessages,  Unit_NumericConsts,
  cxCheckBox;

type
  TfmManHospControl = class(TForm)
    HospPageControl: TPageControl;
    FirstPage: TTabSheet;
    SecondPage: TTabSheet;
    GroupBoxList: TcxGroupBox;
    GroupBoxIllness: TcxGroupBox;
    GroupBoxPay: TcxGroupBox;
    LabelSeria: TcxLabel;
    LabelList: TcxLabel;
    LabelNomer: TcxLabel;
    LabelCont: TcxLabel;
    SeriaEdit: TcxTextEdit;
    NomerEdit: TcxTextEdit;
    ListComboBox: TcxComboBox;
    ParentButtonEdit: TcxButtonEdit;
    LabelFormHosp: TcxLabel;
    ComboBoxFormHosp: TcxComboBox;
    cxLabel1: TcxLabel;
    KodEdit: TcxTextEdit;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    EndingBox: TcxComboBox;
    DateEndEdit: TcxDateEdit;
    DateBegLabel: TcxLabel;
    DateendLabel: TcxLabel;
    cxLabel4: TcxLabel;
    PercentBox: TcxComboBox;
    cxLabel5: TcxLabel;
    CancelBtn: TcxButton;
    YesBtn: TcxButton;
    Actions: TActionList;
    ActionYes: TAction;
    cxLabel6: TcxLabel;
    cxStyleRepository1: TcxStyleRepository;
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
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    GridExept: TcxGrid;
    GridExeptDBTableView1: TcxGridDBTableView;
    Grid2ClPeriodBeg: TcxGridDBColumn;
    Grid2ClPeriodEnd: TcxGridDBColumn;
    GridExeptLevel1: TcxGridLevel;
    NoteMemo: TcxMemo;
    Panel1: TPanel;
    cxLabel7: TcxLabel;
    cxLabel8: TcxLabel;
    AddButton: TcxButton;
    DeleteButton: TcxButton;
    Panel2: TPanel;
    Panel3: TPanel;
    GridRmoving: TcxGrid;
    GridRmovingDBTableView1: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridDBColumn3: TcxGridDBColumn;
    cxGridDBColumn4: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    Panel4: TPanel;
    cxLabel9: TcxLabel;
    cxLabel10: TcxLabel;
    ShiftSpin: TcxSpinEdit;
    SetDefaultMode: TcxButton;
    cxLabel11: TcxLabel;
    cxLabel12: TcxLabel;
    WorkingDays: TcxLabel;
    AllLabel: TcxLabel;
    HolidaysMemo: TcxMemo;
    DateBegEdit: TcxDateEdit;
    IllTypeBox: TcxLookupComboBox;
    VoplComboBox: TcxLookupComboBox;
    WorkModeBox: TcxLookupComboBox;
    cxButton1: TcxButton;
    Panel5: TPanel;
    CheckBoxInfinity: TcxCheckBox;
    GroupBoxPeriod: TcxGroupBox;
    procedure ParentButtonEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure AddButtonClick(Sender: TObject);
    procedure WorkModeBoxPropertiesChange(Sender: TObject);
    procedure DeleteButtonClick(Sender: TObject);
    procedure SetDefaultModeClick(Sender: TObject);
    procedure YesBtnClick(Sender: TObject);
    procedure DateBegEditExit(Sender: TObject);
    procedure WorkModeBoxExit(Sender: TObject);
    procedure ComboBoxFormHospPropertiesChange(Sender: TObject);
    procedure IllTypeBoxKeyPress(Sender: TObject; var Key: Char);
    procedure IllTypeBoxEnter(Sender: TObject);
    procedure DateBegEditEnter(Sender: TObject);
    procedure VoplComboBoxEnter(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure HolidaysMemoKeyPress(Sender: TObject; var Key: Char);
    procedure CheckBoxInfinityPropertiesChange(Sender: TObject);
    procedure SeriaEditKeyPress(Sender: TObject; var Key: Char);
    procedure ListComboBoxPropertiesChange(Sender: TObject);
    procedure ListComboBoxPropertiesPopup(Sender: TObject);
    procedure ListComboBoxPropertiesNewLookupDisplayText(Sender: TObject;
      const AText: TCaption);
    procedure ShiftSpinPropertiesChange(Sender: TObject);
    procedure PercentBoxPropertiesChange(Sender: TObject);
  private
   DM:TDM;
   PRes:Variant;
   PParameter:THospRMovingParameter;
   PKod_VidOpl:integer;
   PlanguageIndex: Byte;
   Idparent : integer;
   id_man_hosp : integer;
   Default_Work_Mode,Work_Mode_setup: Integer;
   Default_Shift: Integer;
   is_create: Integer;
   typealg : integer;
   max_date :tdate;
   procedure LoadWorkMode;
   procedure LoadExcept;
   procedure WorkingDaysList;
   procedure LoadMovingMode(Date_Beg: TDate; Date_End : Tdate);
   procedure LoadIllType(version : integer);
   procedure SetDefaultWorkMode;
   procedure GetDefaultWorkMode(Date_Beg: TDate);
   procedure MemoryDataMovingAfterScroll(DataSet: TDataSet);
   procedure FindAlg(id_hosp : integer);
  public
    constructor Create(AParameter:THospRMovingParameter);reintroduce;
    property Res:Variant read PRes;
  end;

function ViewHospRMovingControl(AParameter:THospRMovingParameter):Variant;stdcall;
 exports ViewHospRMovingControl;

implementation

uses FIBQuery, Math;

{$R *.dfm}

function ViewHospRMovingControl(AParameter:THospRMovingParameter):Variant;stdcall;
var Form:TfmManHospControl;
    Res:Variant;
begin
 Form:=TfmManHospControl.Create(AParameter);
 if AParameter.AControlFormStyle<>zcfsDelete then
 begin
    Form.ShowModal;
 end;
 Res:=Form.Res;
 Form.Free;
 Result:=Res;
end;

constructor TfmManHospControl.Create(AParameter:THospRMovingParameter);
var KodSetup:integer;
    DBeg,DEnd:TDate;
    ill_type_version : integer;
    ending_tmp : string;
begin
   inherited Create(AParameter.AOwner);
   DM:=TDM.Create(AParameter);
   PParameter:=AParameter;
   PRes:=NULL;
   PLanguageIndex:=LanguageIndex;

   FirstPage.Caption       := ZHosp_page_main[PLanguageIndex];
   SecondPage.Caption      := ZHosp_page_additional[PLanguageIndex];
   GroupBoxList.Caption     := ZHosp_list[PLanguageIndex];
   LabelSeria.Caption      := ZHosp_Seria[PLanguageIndex];
   LabelList.Caption       := ZHosp_list[PLanguageIndex];
   LabelNomer.Caption      := ZHosp_Nomer[PLanguageIndex];
   LabelCont.Caption       := ZHosp_Cont[PLanguageIndex];
   LabelFormHosp.Caption   := ZHosp_Form[PLanguageIndex];
   GroupBoxIllness.Caption := ZHosp_Illness[PLanguageIndex];
   cxLabel1.Caption        := ZHosp_Illness_Shifr[PLanguageIndex];
   cxLabel2.Caption        := ZHosp_Illness_Type[PLanguageIndex];
   cxLabel3.Caption        := ZHosp_Illness_Ending[PLanguageIndex];
   DateBegLabel.Caption    := ZHosp_DateBeg[PLanguageIndex];
   DateendLabel.Caption    := ZHosp_DateEnd[PLanguageIndex];
   GroupBoxPay.Caption     := ZHosp_Payment[PLanguageIndex];
   cxLabel4.Caption        := ZHosp_Payment_Procent[PLanguageIndex];
   cxLabel5.Caption        := ZHosp_Payment_vid[PLanguageIndex];
   cxLabel6.Caption        := ZHosp_Rmoving[PLanguageIndex];
   cxLabel7.Caption        := ZHosp_Exception_Mode[PLanguageIndex];
   cxLabel8.Caption        := ZHosp_Note[PLanguageIndex];
   cxLabel9.Caption        := ZHosp_Work_Mode[PLanguageIndex];
   cxLabel10.Caption       := ZHosp_Shift[PLanguageIndex];
   cxLabel11.Caption       := ZHosp_working_day[PLanguageIndex];
   cxLabel12.Caption       := ZHosp_weekend_day[PLanguageIndex];
   SetDefaultMode.Caption  := ZHosp_GetMode[PLanguageIndex];
   YesBtn.Caption          := ZHosp_Ok[PLanguageIndex];
   AddButton.Caption       := InsertBtn_Caption[PLanguageIndex];
   DeleteButton .Caption   := DeleteBtn_Caption[PLanguageIndex];
   CancelBtn.Caption       := ZHosp_Cancel[PLanguageIndex];
   Grid2ClPeriodBeg.Caption := ZHosp_Z[PLanguageIndex];
   Grid2ClPeriodEnd.Caption := ZHosp_Po[PLanguageIndex];
   cxGridDBColumn1.Caption := ZHosp_Rmoving_type[PLanguageIndex];
   cxGridDBColumn2.Caption := ZHosp_Z[PLanguageIndex];
   cxGridDBColumn3.Caption := ZHosp_Po[PLanguageIndex];
   cxGridDBColumn4.Caption := ZHosp_POst[PLanguageIndex];
   
   HospPageControl.ActivePage := FirstPage;

   IDPARENT := -1;
   DateBegEdit.Date                      := date;
   DateEndEdit.Date                      := date;
   ListComboBox.ItemIndex                := 0;
   ComboBoxFormHosp.ItemIndex            := 1;
   typealg                               := 0;


   VoplComboBox.Properties.ListSource:=DM.DSVidOpl;
   DM.DSetVidOpl.SQLs.SelectSQL.Text := 'SELECT * from Sp_VidOpl_Select(401)';
   DM.DSetVidOpl.Open;
   VoplComboBox.Properties.KeyFieldNames  := 'ID_VIDOPL';
   VoplComboBox.Properties.ListFieldNames := 'NAME_VIDOPL';

   DM.DataSetSetup.Close;
   DM.DataSetSetup.SQLs.SelectSQL.Text := 'SELECT * from Z_SETUP';
   DM.DataSetSetup.Open;

   Work_Mode_setup  := DM.DataSetSetup.FieldByName('ID_WORKMODE_DEFAULT').AsInteger;


   DM.DataSetSysData.Close;
   DM.DataSetSysData.SQLs.SelectSQL.Text := 'SELECT * from PUB_SYS_DATA';
   DM.DataSetSysData.Open;

   max_date         := DM.DataSetSysData.FieldByName('INFINITY_DATE').AsDateTime;

   is_create := 0;

   LoadWorkMode;


   GridRMovingDBTableView1.DataController.DataSource := DM.DataSource;
   GridExeptDBTableView1.DataController.DataSource := DM.DSourceExcept;


   case AParameter.AControlFormStyle of
   zcfsInsert:
   begin
       FindAlg(0);
       Caption                               := ZManHosp_Caption_Insert[PLanguageIndex];

       EndingBox.ItemIndex                   := 0;
       DateBegEdit.Date                      := date;
       DateEndEdit.Date                      := date;
       WorkModeBox.Properties.ListFieldIndex := 0;
       id_man_hosp                           := DM.DB.Gen_Id('ID_MAN_HOSP_GENERATOR',1);

       LoadIllType(2);
       IllTypeBox.EditValue  := 1;
       PercentBox.ItemIndex   := 0;

       if (TypeAlg=1) then
       begin

             LoadMovingMode(date, date);
             SetDefaultMode.Visible := false;
       end else
       begin
              SetDefaultModeClick(Self);
              Panel3.Visible :=false;
       end;
   end;

   zcfsUpdate:
   begin
       Caption                               := ZManHosp_Caption_Update[PLanguageIndex];

       id_man_hosp    := PParameter.AId_hosp;

       FindAlg(id_man_hosp);
       with DM do
       try
           StProc.Transaction.StartTransaction;
           DM.DataSetHosp.Close;
           DM.DataSetHosp.SQLs.SelectSQL.Text :='select * from MAN_HOSPITAL where id_man_hosp=:id_man_hosp';
           DM.DataSetHosp.ParamByName('id_man_hosp').AsInteger :=id_man_hosp;
           DM.DataSetHosp.Open;
           SeriaEdit.Text                        := DataSetHosp.FieldByName('SERIA').AsString;
           NomerEdit.Text                        := DataSetHosp.FieldByName('NOMER').AsString;
           KodEdit.Text                          := DataSetHosp.FieldByName('KOD').AsString;
           EndingBox.ItemIndex                   := DataSetHosp.FieldByName('ENdING').AsInteger-1;
           DateBegEdit.Date                      := DataSetHosp.FieldByName('DATE_BEG').AsDateTime;
           DateEndEdit.Date                      := DataSetHosp.FieldByName('DATE_END').AsDateTime;
           NoteMemo.Text                         := DataSetHosp.FieldByName('ILNESS_NOTES').AsVariant;
           if(DateEndEdit.Date=max_date) then
               CheckBoxInfinity.Checked := true;
           ComboBoxFormHosp.ItemIndex            := DataSetHosp.FieldByName('Hosp_Version').AsInteger-1;
           IDPARENT                              := DataSetHosp.FieldByName('ID_PARENT').AsInteger;
           ill_type_version :=ComboBoxFormHosp.ItemIndex +1;
           LoadIllType(ill_type_version);

           IllTypeBox.EditValue                  := DataSetHosp.FieldByName('ILLNESS_TYPE').AsInteger;

           case DataSetHosp.FieldByName('PERCENT').AsInteger  of
             0: PercentBox.ItemIndex   := 0;
             50: PercentBox.ItemIndex  := 1;
             60: PercentBox.ItemIndex  := 2;
             70: PercentBox.ItemIndex  := 3;
             80: PercentBox.ItemIndex  := 4;
             100: PercentBox.ItemIndex := 5;
           end;

         if IDParent <> -1 then
         begin
              ListComboBox.ItemIndex := 1;
              DM.DataSetParent.Close;
              DM.DataSetParent.SQLs.SelectSQL.Text:='SELECT NOMER FROM MAN_HOSPITAL WHERE ID_MAN_HOSP='+inttostr(IDParent);
              DM.DataSetParent.Open;
              ParentButtonEdit.Text                             := DataSetParent.FieldByName('NOMER').AsString;
         end;

         VoplComboBox.EditValue                := DataSetHosp.FieldByName('VOPL').AsInteger;

         LoadExcept;

         while not DM.DSetExcept.Eof do
         begin
            DM.MemoryData.Open;
            DM.MemoryData.Insert;
            DM.MemoryData.FieldByName('DateBegexcept').Value      := DM.DSetExcept['Date_BEG'];
            DM.MemoryData.FieldByName('DateEndexcept').Value      := DM.DSetExcept['Date_END'];
            DM.MemoryData.Post;
            DM.DSetExcept.Next;
         end;

         if (TypeAlg=1) then
         begin
             LoadMovingMode(DateBegEdit.Date, DateBegEdit.Date);
             SetDefaultMode.Visible := false;
         end else
         begin
              Panel3.Visible :=false;
             // SetDefaultMode.Visible := false;
              WorkModeBox.EditValue  := DataSetHosp.FieldByName('ID_WORK_MODE').AsInteger;
              ShiftSpin.Value        := DataSetHosp.FieldByName('SHIFT').AsVariant;
         end;



        StProc.Transaction.Commit;
        except
        on E:Exception do
         begin
          ZShowMessage(Error_Caption[PLanguageIndex],e.Message,mtError,[mbOK]);
          StProc.Transaction.Rollback;
         end;
       end;
   end;

   zcfsShowDetails:
   begin
       Caption                               := 'Перегляд листов ТН';

       id_man_hosp    := PParameter.AId_hosp;

       FindAlg(id_man_hosp);
       with DM do
       try
           StProc.Transaction.StartTransaction;
           DM.DataSetHosp.Close;
           DM.DataSetHosp.SQLs.SelectSQL.Text :='select * from MAN_HOSPITAL where id_man_hosp=:id_man_hosp';
           DM.DataSetHosp.ParamByName('id_man_hosp').AsInteger :=id_man_hosp;
           DM.DataSetHosp.Open;
           SeriaEdit.Text                        := DataSetHosp.FieldByName('SERIA').AsString;
           NomerEdit.Text                        := DataSetHosp.FieldByName('NOMER').AsString;
           KodEdit.Text                          := DataSetHosp.FieldByName('KOD').AsString;
           EndingBox.ItemIndex                   := DataSetHosp.FieldByName('ENdING').AsInteger-1;
           DateBegEdit.Date                      := DataSetHosp.FieldByName('DATE_BEG').AsDateTime;
           DateEndEdit.Date                      := DataSetHosp.FieldByName('DATE_END').AsDateTime;
           NoteMemo.Text                         := DataSetHosp.FieldByName('ILNESS_NOTES').AsVariant;
           if(DateEndEdit.Date=max_date) then
               CheckBoxInfinity.Checked := true;
           ComboBoxFormHosp.ItemIndex            := DataSetHosp.FieldByName('Hosp_Version').AsInteger-1;
           IDPARENT                              := DataSetHosp.FieldByName('ID_PARENT').AsInteger;
           ill_type_version :=ComboBoxFormHosp.ItemIndex +1;
           LoadIllType(ill_type_version);

           IllTypeBox.EditValue                  := DataSetHosp.FieldByName('ILLNESS_TYPE').AsInteger;

           case DataSetHosp.FieldByName('PERCENT').AsInteger  of
             0: PercentBox.ItemIndex   := 0;
             50: PercentBox.ItemIndex  := 1;
             60: PercentBox.ItemIndex  := 2;
             70: PercentBox.ItemIndex  := 3;
             80: PercentBox.ItemIndex  := 4;
             100: PercentBox.ItemIndex := 5;
           end;

         if IDParent <> -1 then
         begin
              ListComboBox.ItemIndex := 1;
              DM.DataSetParent.Close;
              DM.DataSetParent.SQLs.SelectSQL.Text:='SELECT NOMER FROM MAN_HOSPITAL WHERE ID_MAN_HOSP='+inttostr(IDParent);
              DM.DataSetParent.Open;
              ParentButtonEdit.Text                             := DataSetParent.FieldByName('NOMER').AsString;
         end;

         VoplComboBox.EditValue                := DataSetHosp.FieldByName('VOPL').AsInteger;

         LoadExcept;

         while not DM.DSetExcept.Eof do
         begin
            DM.MemoryData.Open;
            DM.MemoryData.Insert;
            DM.MemoryData.FieldByName('DateBegexcept').Value      := DM.DSetExcept['Date_BEG'];
            DM.MemoryData.FieldByName('DateEndexcept').Value      := DM.DSetExcept['Date_END'];
            DM.MemoryData.Post;
            DM.DSetExcept.Next;
         end;

         if (TypeAlg=1) then
         begin
             LoadMovingMode(DateBegEdit.Date, DateBegEdit.Date);
             SetDefaultMode.Visible := false;
         end else
         begin
              Panel3.Visible :=false;
             // SetDefaultMode.Visible := false;
              WorkModeBox.EditValue  := DataSetHosp.FieldByName('ID_WORK_MODE').AsInteger;
         end;



        StProc.Transaction.Commit;
        except
        on E:Exception do
         begin
          ZShowMessage(Error_Caption[PLanguageIndex],e.Message,mtError,[mbOK]);
          StProc.Transaction.Rollback;
         end;
       end;

       GroupBoxList.Enabled := false;
       GroupBoxIllness.Enabled := false;
       GroupBoxPeriod.Enabled := false;
       GroupBoxPay.Enabled := false;
       Panel4.Enabled := false;
   end;

   zcfsDelete:
   begin

       Caption                               := ZManHosp_Caption_Delete[PLanguageIndex];

    if ZShowMessage(ZManHosp_Caption_Delete[PLanguageIndex],
                    DeleteRecordQuestion_Text[PLanguageIndex],mtConfirmation,[mbYes,mbCancel])=mrYes then

     with DM do
      try
       DB.Handle:=AParameter.ADb_Handle;
       StProc.Transaction.StartTransaction;

       StProc.StoredProcName:='MAN_HOSPITAL_R_MOVING_DEL';
       StProc.Prepare;
       StProc.ParamByName('ID_MAN_HOSP').AsInteger:=AParameter.AId_hosp;
       StProc.ExecProc;

       StProc.StoredProcName:='EXCEPT_HOSP_PERIOD_DELETE';
       StProc.Prepare;
       StProc.ParamByName('ID_MAN_HOSP').AsInteger:=AParameter.AId_hosp;
       StProc.ExecProc;

       StProc.StoredProcName:='MAN_HOSPITAL_DELETE';
       StProc.Prepare;
       StProc.ParamByName('ID_MAN_HOSP').AsInteger:=AParameter.AId_hosp;
       StProc.ExecProc;

       StProc.Transaction.Commit;
       PRes:=-1;
      except
       on E:Exception do
        begin
         ZShowMessage(Error_Caption[PlanguageIndex],e.Message,mtError,[mbOK]);
         StProc.Transaction.Rollback;
        end;
      end;
   end;
  end;

end;

procedure TfmManHospControl.LoadIllType(version : integer);
begin
   IllTypeBox.Properties.ListSource:=DM.DSourceTypes;

   DM.DSetTypes.Close;
   DM.DSetTypes.SQLs.SelectSQL.Text := 'SELECT ILLNESS_TYPE, (ILLNESS_TYPE ||'' - ''|| TITLE) as Title FROM MAN_HOSP_TYPE_DISEASE where hosp_version='+inttostr(version);
   DM.DSetTypes.Open;

   IllTypeBox.Properties.KeyFieldNames  := 'ILLNESS_TYPE';
   IllTypeBox.Properties.ListFieldNames := 'TITLE';
end;

procedure TfmManHospControl.FindAlg(id_hosp : integer);
begin
    DM.DataSet.Close;
    DM.DataSet.SQLs.SelectSQL.Text := 'SELECT * FROM Z_GET_SYS_ALGORITM (:id_alg,:ac_date,:id_param)';
    DM.DataSet.ParamByName('id_alg').AsInteger   := 2;
    DM.DataSet.ParamByName('ac_date').Asdate     := date;
    DM.DataSet.ParamByName('id_param').AsInteger := id_hosp;
    DM.DataSet.Open;

    TypeAlg  := DM.DataSet['ACTIV_ALGORITM'];
end;

procedure TfmManHospControl.LoadMovingMode(Date_Beg: TDate; Date_End : Tdate);
var i : integer;
begin
   DM.MemoryDataMoving.AfterScroll := nil;

   while DM.MemoryDataMoving.RecordCount>0 do
   begin
        DM.MemoryDataMoving.Delete;
        DM.MemoryDataMoving.Next;
   end;

   case PParameter.AControlFormStyle of
   zcfsInsert:
   begin
       GridRMovingDBTableView1.DataController.DataSource := DM.DataSource;

       DM.DataSet.Close;
       DM.DataSet.SQLs.SelectSQL.Text:='SELECT * FROM Z_PEOPLE_WORKMODE_SELECT_PERIOD('''+IntToStr(PParameter.AId)+''',null, '''+
                                  DateToStr(Date_Beg)+''','''+DateToStr(Date_End)+''') order by RMOVING';
       DM.DataSet.Open;
       DM.DataSet.FetchAll;

       DM.DataSet.First;
       while not DM.DataSet.Eof do
       begin
            DM.MemoryDataMoving.Open;
            DM.MemoryDataMoving.Insert;
            DM.MemoryDataMoving.FieldByName('rmoving').Value                 := DM.DataSet['rmoving'];
            if (DM.DataSet['id_workmode']<>null)   then
                 DM.MemoryDataMoving.FieldByName('id_workmode').Value             := DM.DataSet['id_workmode']
            else
                 DM.MemoryDataMoving.FieldByName('id_workmode').Value             := Work_Mode_setup;
            if (DM.DataSet['shift']<>null)   then
                 DM.MemoryDataMoving.FieldByName('shift').Value                   := DM.DataSet['shift']
            else
                 DM.MemoryDataMoving.FieldByName('shift').Value                   := 0;
            DM.MemoryDataMoving.FieldByName('name_sovmest').Value            := DM.DataSet['name_sovmest'];
            DM.MemoryDataMoving.FieldByName('date_beg_rmoving').Value        := DM.DataSet['date_beg_rmoving'];
            DM.MemoryDataMoving.FieldByName('date_end_rmoving').Value        := DM.DataSet['date_end_rmoving'];
            DM.MemoryDataMoving.FieldByName('vpost').Value                   := DM.DataSet['vpost'];
            if (DM.DataSet['id_hospital_r_moving']<>null)   then
                 DM.MemoryDataMoving.FieldByName('id_hospital_r_moving').Value    := DM.DataSet['id_hospital_r_moving']
            else  DM.MemoryDataMoving.FieldByName('id_hospital_r_moving').Value    := 0;
            DM.MemoryDataMoving.Post;
            DM.DataSet.Next;
       end;


       DM.MemoryDataMoving.AfterScroll := MemoryDataMovingAfterScroll;

      if DM.MemoryDataMoving.FieldByName('id_workmode').Value <>null then
      begin
          WorkModeBox.EditValue := DM.MemoryDataMoving.FieldByName('id_workmode').Value;
          ShiftSpin.Value       := DM.MemoryDataMoving.FieldByName('shift').Value;
      end else
      begin
          WorkModeBox.EditValue := Work_Mode_setup;
          ShiftSpin.Value       := 0;
      end;
      WorkingDaysList;
   end;

   zcfsUpdate:
   begin

       DM.DataSet.Close;
       DM.DataSet.SQLs.SelectSQL.Text:='SELECT * FROM Z_PEOPLE_WORKMODE_SELECT_PERIOD('''+IntToStr(PParameter.AId)+''','''+IntToStr(Id_man_hosp)+''','''+
                                  DateToStr(DateBegEdit.Date )+''','''+DateToStr(DateBegEdit.Date)+''') order by RMOVING';
       DM.DataSet.Open;
       DM.DataSet.FetchAll;


       DM.DataSet.First;
       while not DM.DataSet.Eof do
       begin
            DM.MemoryDataMoving.Open;
            DM.MemoryDataMoving.Insert;
            DM.MemoryDataMoving.FieldByName('rmoving').Value                 := DM.DataSet['rmoving'];
            DM.MemoryDataMoving.FieldByName('id_workmode').Value             := DM.DataSet['id_workmode'];
            DM.MemoryDataMoving.FieldByName('shift').Value                   := DM.DataSet['shift'];
            DM.MemoryDataMoving.FieldByName('name_sovmest').Value            := DM.DataSet['name_sovmest'];
            DM.MemoryDataMoving.FieldByName('date_beg_rmoving').Value        := DM.DataSet['date_beg_rmoving'];
            DM.MemoryDataMoving.FieldByName('date_end_rmoving').Value        := DM.DataSet['date_end_rmoving'];
            DM.MemoryDataMoving.FieldByName('vpost').Value                   := DM.DataSet['vpost'];
            DM.MemoryDataMoving.FieldByName('id_hospital_r_moving').Value    := DM.DataSet['id_hospital_r_moving'];
            DM.MemoryDataMoving.Post;
            DM.DataSet.Next;
       end;


      DM.MemoryDataMoving.AfterScroll := MemoryDataMovingAfterScroll;

      if DM.MemoryDataMoving.FieldByName('id_workmode').Value <>null then
      begin
          WorkModeBox.EditValue := DM.MemoryDataMoving.FieldByName('id_workmode').Value;
          ShiftSpin.Value       := DM.MemoryDataMoving.FieldByName('shift').Value;
      end else
      begin
          WorkModeBox.EditValue := Work_Mode_setup;
          ShiftSpin.Value       := 0;
      end;
      WorkingDaysList;
   end;
   end;
end;

procedure TfmManHospControl.SetDefaultWorkMode;
var
    shift: Integer;
begin
    if(typealg<>1) then
    begin
        WorkModeBox.EditValue   := Default_Work_Mode;
        shift := Default_Shift;
        ShiftSpin.Value := shift;
    end;
end;

procedure TfmManHospControl.MemoryDataMovingAfterScroll(DataSet: TDataSet);
begin
    if DM.MemoryDataMoving.FieldByName('id_workmode').Value <>null then
    begin
       WorkModeBox.EditValue := DM.MemoryDataMoving.FieldByName('id_workmode').Value;
       ShiftSpin.Value       := DM.MemoryDataMoving.FieldByName('shift').Value;
    end;
    // if DM.DataSet['ID_WORKMODE']<>null then
    //      WorkModeBox.EditValue := DM.DataSet['ID_WORKMODE'];
end;

procedure TfmManHospControl.LoadWorkMode;
begin
   WorkModeBox.Properties.ListSource:=DM.DSOurceMode;
   DM.DSetMode.Close;
   DM.DSetMode.SQLs.SelectSQL.Text := 'SELECT * FROM TU_WORK_MODE_S(Null,Null,Null,Null,Null,'''+datetostr(DateBegEdit.Date)+''','''+datetostr(DatebegEdit.Date)+''',-1, null)';
   DM.DSetMode.Open;
   WorkModeBox.Properties.KeyFieldNames  := 'ID_WORK_MODE';
   WorkModeBox.Properties.ListFieldNames := 'NAME';
end;


procedure TfmManHospControl.LoadExcept;
begin
   DM.DSetExcept.Close;
   DM.DSetExcept.SQLs.SelectSQL.Text := 'SELECT DATE_BEG,DATE_END FROM EXCEPT_HOSP_PERIOD WHERE ID_MAN_HOSP=:ID_MAN_HOSP';
   DM.DSetExcept.ParamByName('ID_MAN_HOSP').AsInteger := id_man_hosp;
   DM.DSetExcept.Open;

end;

procedure TfmManHospControl.GetDefaultWorkMode(Date_Beg: TDate);
begin
    DM.DataSetModeDefault.Close;
    DM.DataSetModeDefault.SQLs.SelectSQL.Text := 'SELECT Id_Work_Mode, Shift FROM Get_Work_Mode_By_PCard(:Id_PCard, :Date_Beg)';
    DM.DataSetModeDefault.ParamByName('Id_PCard').AsInteger := pparameter.AId_pcard;
    DM.DataSetModeDefault.ParamByName('Date_Beg').AsDate    := Date_Beg;
    DM.DataSetModeDefault.Open;
    Default_Work_Mode                             := DM.DataSetModeDefault.FieldByName('Id_Work_Mode').AsInteger;
    Default_Shift                                 := DM.DataSetModeDefault.FieldByName('Shift').AsInteger;
end;

procedure TfmManHospControl.ParentButtonEditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    T:TfmManHospSelect;
    date_beg_cont : Tdate;
begin
    if (PParameter.AControlFormStyle= zcfsShowDetails) then exit;
    T:=TfmManHospSelect.Create(Pparameter);
    if T.ShowModal=mrYes then
    begin
         ParentButtonEdit.Text := T.DataSet.FieldByName('Nomer').AsString;
         IDParent              := T.DataSet.FieldByName('ID_MAN_HOSP').AsInteger;
         ListComboBox.ItemIndex          := 1;
         ComboBoxFormHosp.ItemIndex := T.DataSet.FieldByName('Hosp_Version').AsInteger-1;
         date_beg_cont  := T.DataSet.FieldByName('DATE_END').AsDateTime;
         DateBegEdit.Date           := IncDay(date_beg_cont,1);
         KodEdit.Text := T.DataSet.FieldByName('KOD').AsString;
         IllTypeBox.EditValue    := T.DataSet.FieldByName('ILLNESS_TYPE').AsInteger;
         case T.DataSet.FieldByName('PERCENT').AsInteger  of

         0: PercentBox.ItemIndex   := 0;
         50: PercentBox.ItemIndex  := 1;
         60: PercentBox.ItemIndex  := 2;
         70: PercentBox.ItemIndex  := 3;
         80: PercentBox.ItemIndex  := 4;
         100: PercentBox.ItemIndex := 5;
         end;
         VoplComboBox.EditValue := T.DataSet.FieldByName('VOPL').AsInteger;
         DM.DataSetHospDate.Close;
         DM.DataSetHospDate.SQLs.SelectSQL.Text := 'SELECT * FROM Z_HOSP_BEG_FOR_AVG(:ID_HOSP)';
         DM.DataSetHospDate.ParamByName('ID_HOSP').AsInteger := IDParent;
         DM.DataSetHospDate.Open;
         LoadMovingMode(DM.DataSetHospDate['HOSP_DATE'],DM.DataSetHospDate['HOSP_DATE']);
    end;
     T.Free;
end;

procedure TfmManHospControl.AddButtonClick(Sender: TObject);
var
    T:TfmManHospExceptDates;
    date_beg_cont : Tdate;
begin
    if (PParameter.AControlFormStyle = zcfsShowDetails) then exit;
    T:=TfmManHospExceptDates.Create(Self);
    if T.ShowModal=mrYes then
    begin
         DM.MemoryData.Open;
         DM.MemoryData.Insert;
         DM.MemoryData.FieldByName('DateBegExcept').AsDateTime  := T.DateBegEdit.Date;
         DM.MemoryData.FieldByName('DateEndExcept').AsDateTime  := T.DateEndEdit.Date;
         DM.MemoryData.Post;
    end;
     T.Free;
end;

procedure TfmManHospControl.WorkingDaysList;
var
    days_week, days_work : integer;
    days_week_list,days_week_list_tmp,days_end_period : string;
    days_period,days_period_last :  string;
    date_end_tmp : tdate;
    month,month_end : integer;
    month_str,month_end_str : string;
    l : integer;
begin
    days_week := 0;
    days_work := 0;
    days_period_last  := '';
    days_period       := '';
    days_week_list    := '';

    month_end := MonthOf(DateBegEdit.Date);
    if(month_end<=9) then
          month_end_str := '0'+inttostr(month_end)
    else
          month_end_str := inttostr(month_end);

    days_end_period := '01.'+month_end_str+'.'+inttostr(YearOf(DateBegEdit.Date));
    date_end_tmp := strtodate(days_end_period);
    date_end_tmp := IncYear(date_end_tmp,5);
    if(DateEndEdit.Date<date_end_tmp) then
        date_end_tmp :=  DateEndEdit.Date;

    if(DateEndEdit.Date=max_date) then
    begin
        WorkingDays.Caption := '';
        AllLabel.Caption    := '';
        HolidaysMemo.Text   := 'Безстроковий лист ТН';
    end else
    if(DateEndEdit.Date<>max_date) then
    begin
        DM.DataSetdays.Close;
        DM.DataSetdays.SQLs.SelectSQL.Text := 'SELECT * FROM Z_GET_WORKING_DAYS(:ID_WORK_MODE,:SHIFT,:PERIOD_BEG,:PERIOD_END)';
        DM.DataSetdays.ParamByName('ID_WORK_MODE').AsInteger := WorkModeBox.Editvalue;
        DM.DataSetdays.ParamByName('SHIFT').AsInteger := ShiftSpin.Value;
        DM.DataSetdays.ParamByName('PERIOD_BEG').AsDate := DateBegEdit.Date;
        DM.DataSetdays.ParamByName('PERIOD_END').AsDate := date_end_tmp;
        DM.DataSetdays.Open;
        DM.DataSetdays.FetchAll;

        DM.DataSetdays.First;
        While not DM.DataSetdays.Eof do
        begin
            if(DM.DataSetdays['TYPE_DAY']=0) then
            begin
                month := MonthOf(DM.DataSetdays['WORK_DATE']);
                if(month<=9) then
                    month_str := '0'+inttostr(month)
                else
                    month_str := inttostr(month);

                days_period := month_str+'/'+inttostr(YearOf(DM.DataSetdays['WORK_DATE']));
                l := length(days_week_list);
                if(days_period_last = days_period) then
                    days_week_list := days_week_list+inttostr(DayOf(DM.DataSetdays['WORK_DATE']))+', '
                else
                begin
                    if(l>0) then
                    begin
                        days_week_list := Copy(days_week_list,1, l-2);
                        days_week_list := days_week_list+';'+#13#10+days_period+': '+inttostr(DayOf(DM.DataSetdays['WORK_DATE']))+', ';
                    end
                    else
                    begin
                        days_week_list := days_period+': '+inttostr(DayOf(DM.DataSetdays['WORK_DATE']))+', ';
                    end;
                end;

                days_week := days_week+1;
            end else
            begin
                days_work := days_work+1;
            end;
            days_period_last := days_period;
            DM.DataSetdays.Next;
        end;
        l := length(days_week_list);
        days_week_list := Copy(days_week_list,1, l-2)+';';
        WorkingDays.Caption := inttostr(days_work);
        AllLabel.Caption := inttostr(days_week);
        HolidaysMemo.Text := days_week_list;
    end;
end;

procedure TfmManHospControl.WorkModeBoxPropertiesChange(Sender: TObject);
begin
     WorkingDaysList;
end;

procedure TfmManHospControl.DeleteButtonClick(Sender: TObject);
begin
    if (PParameter.AControlFormStyle = zcfsShowDetails) then exit;
    if not DM.MemoryData.IsEmpty then
    begin
        DM.MemoryData.Delete;
    end;

end;

procedure TfmManHospControl.SetDefaultModeClick(Sender: TObject);
begin
     if (PParameter.AControlFormStyle = zcfsShowDetails) then exit;
     GetDefaultWorkMode(DateBegEdit.Date);
     SetDefaultWorkMode;
     WorkingDaysList;
end;

procedure TfmManHospControl.YesBtnClick(Sender: TObject);
var  Res:Integer;
     holiday_str : string;
     holiday : integer;
     perc: double;
     work_str: String;
begin
    if (PParameter.AControlFormStyle= zcfsShowDetails) then exit;

    if (SeriaEdit.Text='') then
    begin
       Showmessage('Необхідно заповнити серію!');
       SeriaEdit.SetFocus;
       SeriaEdit.Style.Color :=$00C7B5FD;
       exit;
    end else SeriaEdit.Style.Color :=clWindow;

    if (NomerEdit.Text='') then
    begin
       Showmessage('Необхідно заповнити номер!');
       NomerEdit.SetFocus;
       NomerEdit.Style.Color :=$00C7B5FD;
       exit;
    end else NomerEdit.Style.Color :=clWindow;

    if (KodEdit.Text='') then
    begin
       Showmessage('Необхідно заповнити шифр захворювання!');
       KodEdit.SetFocus;
       KodEdit.Style.Color :=$00C7B5FD;
       exit;
    end else KodEdit.Style.Color :=clWindow;

    if (DateBegEdit.Date>DateEndEdit.Date) then
    begin
        DateBegEdit.Style.Color := $00C7B5FD;
        DateEndEdit.Style.Color := $00C7B5FD;
        Showmessage('Невірний період: дата початку більше дати закінчення');
        DateBegEdit.SetFocus;
        exit;
    end else
    begin
        DateBegEdit.Style.Color := clWindow;
        DateEndEdit.Style.Color := clWindow;
    end;

    if (VoplComboBox.Text='') then
    begin
       Showmessage('Необхідно заповнити вид оплати!');
       VoplComboBox.SetFocus;
       VoplComboBox.Style.Color :=$00C7B5FD;
       exit;
    end else VoplComboBox.Style.Color :=clWindow;

    if (Idparent > 0) <> (ListComboBox.ItemIndex = 1) then
    begin
         Showmessage('Дані по продовженню не співпадають!');
         Exit;
    end;

    // проверить Не находится ли человек в отпуске на дату начала больничного (Валик, 28.02.2005)
    holiday_str := '';
    holiday := 0;


    DM.DataSetOtpusk.Close;
    DM.DataSetOtpusk.SQLs.SelectSQL.Text  := 'SELECT * FROM HL_LIST_HOLIDAYS_BY_PCARDPERIOD(:ID_PCARD, :PERIOD_BEG, :PERIOD_END)';
    DM.DataSetOtpusk.ParamByName('Id_PCard').AsInteger := pparameter.AId_pcard;
    DM.DataSetOtpusk.ParamByName('Period_Beg').AsDate := DateBegEdit.Date;
    DM.DataSetOtpusk.ParamByName('Period_End').AsDate := DateEndEdit.Date;
    DM.DataSetOtpusk.Open;

    if (not DM.DataSetOtpusk.IsEmpty) then
        holiday := 1;

    DM.DataSetOtpusk.First;
    while not DM.DataSetOtpusk.Eof do
    begin
                holiday_str := holiday_str + #13#10 + DM.DataSetOtpusk['Type_Holiday'] +
                    ' з ' + DateToStr(DM.DataSetOtpusk['Holiday_Beg']) + ' по ' +
                    DateToStr(DM.DataSetOtpusk['Holiday_End']) + ' наказ ' +
                    DM.DataSetOtpusk['ORDER_STR'];
               DM.DataSetOtpusk.Next;
    end;


    holiday_str := holiday_str + #13#10;


    if holiday=1 then
    begin
        if ZShowMessage(ZManHosp_Caption_Delete[PLanguageIndex],
                    'На цей період людина знаходиться у відпустці. '+holiday_str + 'Додати лист непрацездатності?',mtConfirmation,[mbYes,mbCancel])=mrCancel then
            begin
                Exit;
            end;
    end;

          // проверить, не выходит ли больничный за пределы трудового договора
    perc := StrToFloat(PercentBox.Text);

    if perc >= 0.01 then
    begin
         DM.DataSetOtpusk.Close;
         DM.DataSetOtpusk.SQLs.SelectSQL.Text := 'SELECT * FROM UP_WORK_PERIOD_BY_PCARD(:Id_Pcard)';
         DM.DataSetOtpusk.ParamByName('Id_PCard').AsInteger := pparameter.AId_pcard;
         DM.DataSetOtpusk.Open;

         if DM.DataSetOtpusk.IsEmpty or VarIsNull(DM.DataSetOtpusk['Period_Beg'])
              or VarIsNull(DM.DataSetOtpusk['Period_End'])
              or (DateBegEdit.Date < DM.DataSetOtpusk['Period_Beg'])
              or (DateEndEdit.Date > DM.DataSetOtpusk['Period_End']) then
         begin
              work_str := '';
              if not VarIsNull(DM.DataSetOtpusk['Period_Beg'])
                        and not VarIsNull(DM.DataSetOtpusk['Period_End']) then
              begin
                     work_str := '(період роботи з ' +
                     DateToStr(DM.DataSetOtpusk['Period_Beg']) + ' по ' +
                     DateToStr(DM.DataSetOtpusk['Period_End']) + ')';

                      if ZShowMessage(ZManHosp_Caption_Delete[PLanguageIndex], 'Ця людина не працює на період хвороби '+work_str + '. Занести лист непрацездатності?',mtConfirmation,[mbYes,mbCancel])=mrCancel then
                      begin
                         Exit;
                      end;
               end;
                DM.DataSetOtpusk.Free;
         end;
    end;


    with DM do
    try
     StProcTransaction.StartTransaction;
     case PParameter.AControlFormStyle of
      zcfsInsert: StProc.StoredProcName:='MAN_HOSPITAL_INSERT';
      zcfsUpdate: StProc.StoredProcName:='MAN_HOSPITAL_UPDATE';
     end;
     StProc.Prepare;


     StProc.ParamByName('seria').AsString         := SeriaEdit.Text;
     StProc.ParamByName('nomer').AsString         := NomerEdit.Text;
     StProc.ParamByName('ilness_notes').AsString  := NoteMemo.Text;
     StProc.ParamByName('date_beg').AsDate        := DateBegEdit.Date;
     StProc.ParamByName('date_end').AsDate        := DateEndEdit.Date;
     StProc.ParamByName('vopl').AsInteger         := VoplComboBox.Editvalue;
     StProc.ParamByName('percent').AsInteger      := strtoint(PercentBox.Text);
     StProc.ParamByName('kod').AsString           := KodEdit.Text;
     StProc.ParamByName('illness_type').AsInteger := IllTypeBox.EditValue;
     StProc.ParamByName('ending').AsInteger       := EndingBox.ItemIndex+1;
     StProc.ParamByName('id_pcard').AsInteger     := PParameter.AId_pcard;
     StProc.ParamByName('hosp_version').Asinteger := ComboBoxFormHosp.ItemIndex+1;
     StProc.ParamByName('id_man_hosp').AsInteger  := id_man_hosp;
     StProc.ParamByName('id_parent').AsInteger:=IDParent;


     if (TypeAlg=1) then
     begin
         StProc.ParamByName('id_work_mode').AsVariant := null;
         StProc.ParamByName('shift').AsVariant        := null;
     end else
     begin
         StProc.ParamByName('id_work_mode').Asinteger := WorkModeBox.EditValue;
         StProc.ParamByName('shift').AsInteger        := ShiftSpin.Value;
     end;
     StProc.ExecProc;

     StProc.StoredProcName:='EXCEPT_HOSP_PERIOD_DELETE';
     StProc.Prepare;
     StProc.ParamByName('id_man_hosp').AsInteger         := id_man_hosp;
     StProc.ExecProc;

     StProc.StoredProcName:='EXCEPT_HOSP_PERIOD_INSERT';
     StProc.Prepare;

     if (not DM.MemoryData.IsEmpty) then
     begin
         DM.MemoryData.First;
         while not DM.MemoryData.Eof do
         begin
             StProc.ParamByName('id_man_hosp').AsInteger   := id_man_hosp;
             StProc.ParamByName('date_beg').AsDate         := DM.MemoryData.FieldByName('DateBegexcept').AsDateTime;
             StProc.ParamByName('date_end').AsDate         := DM.MemoryData.FieldByName('DateEndexcept').AsDateTime;
             DM.MemoryData.Next;
         end;

         StProc.ExecProc;
     end;

     if (TypeAlg=1) then
     begin
         StProc.StoredProcName:='MAN_HOSPITAL_R_MOVING_IU';
         StProc.Prepare;

         MemoryDataMoving.First;
         while not MemoryDataMoving.Eof do
         begin
             StProc.ParamByName('id_work_dog_moving').AsInteger     := DM.MemoryDataMoving.FieldByName('rmoving').Value ;
             StProc.ParamByName('id_man_hosp').AsInteger            := id_man_hosp;

             case PParameter.AControlFormStyle of
                  zcfsInsert: StProc.ParamByName('id_hospital_r_moving').AsVariant   := null;
                  zcfsUpdate: StProc.ParamByName('id_hospital_r_moving').AsVariant   := DM.MemoryDataMoving.FieldByName('id_hospital_r_moving').Value;
             end;

             StProc.ParamByName('id_workmode').AsInteger            := DM.MemoryDataMoving.FieldByName('id_workmode').Value;

             if(DM.MemoryDataMoving.FieldByName('shift').Value <> null) then
                  StProc.ParamByName('shift').Asinteger                  := DM.MemoryDataMoving.FieldByName('shift').Value
             else
                  StProc.ParamByName('shift').Asinteger                  := 0;
             StProc.ExecProc;

             MemoryDataMoving.Next;
         end;
     end;

     Res:=id_man_hosp;

     StProc.Transaction.Commit;
     PRes:=Res;
     ModalResult:=mrYes;
    except
     on e:Exception do
      begin
       ZShowMessage(Error_Caption[PLanguageIndex],e.message,mtError,[mbOk]);
       StProc.transaction.RollBack;
       PRes:=NULL;
      end;
    end;
end;

procedure TfmManHospControl.DateBegEditExit(Sender: TObject);
begin
   if DateEndEdit.Date=max_date then
   begin
       DateEndEdit.Date := max_date;
       CheckBoxInfinity.Checked := true;
   end;
   if (TypeAlg=1) then
   begin
        Panel3.Visible :=true;
        LoadMovingMode(DateBegEdit.Date, DateBegEdit.Date);
        SetDefaultMode.Visible := false;
   end else
   begin
       DM.MemoryDataMoving.AfterScroll := nil;
        Panel3.Visible :=false;
        SetDefaultModeClick(Self);
   end;
end;

procedure TfmManHospControl.WorkModeBoxExit(Sender: TObject);
begin
      if(TypeAlg=1) then
      begin
          DM.MemoryDataMoving.Open;
          DM.MemoryDataMoving.Edit;
          DM.MemoryDataMoving.FieldByName('id_workmode').Value             := WorkModeBox.EditValue;
          DM.MemoryDataMoving.FieldByName('shift').Value                   := ShiftSpin.Value;
          DM.MemoryDataMoving.Post;
      end;
end;

procedure TfmManHospControl.ComboBoxFormHospPropertiesChange(
  Sender: TObject);
var ill_type_version : integer;
begin
    ill_type_version :=ComboBoxFormHosp.ItemIndex+1;
    LoadIllType(ill_type_version);
end;

procedure TfmManHospControl.IllTypeBoxKeyPress(Sender: TObject;
  var Key: Char);
begin
    key := chr(0);
end;

procedure TfmManHospControl.IllTypeBoxEnter(Sender: TObject);
begin
    if IDParent > 0 then
    begin
        MessageDlg(ZHosp_No_Change_IllType[PLanguageIndex],
            mtError, [mbOk], 0);
        IllTypeBox.SetFocus;
    end;
end;

procedure TfmManHospControl.DateBegEditEnter(Sender: TObject);
begin
    if IDParent > 0 then
    begin
        MessageDlg(ZHosp_No_Change_Date_beg[PLanguageIndex],
            mtError, [mbOk], 0);
        DateBegEdit.SetFocus;
    end;
end;

procedure TfmManHospControl.VoplComboBoxEnter(Sender: TObject);
begin
    if IDParent > 0 then
    begin
        MessageDlg(ZHosp_No_Change_Opl[PLanguageIndex],
            mtError, [mbOk], 0);
        VoplComboBox.SetFocus;
    end;
end;

procedure TfmManHospControl.cxButton1Click(Sender: TObject);
begin
    if (PParameter.AControlFormStyle = zcfsShowDetails) then exit;
    if not DM.MemoryDataMoving.IsEmpty then
    begin
        DM.MemoryDataMoving.Delete;
    end;
end;

procedure TfmManHospControl.HolidaysMemoKeyPress(Sender: TObject;
  var Key: Char);
begin
     key := chr(0);
end;

procedure TfmManHospControl.CheckBoxInfinityPropertiesChange(
  Sender: TObject);
begin
     if (PParameter.AControlFormStyle = zcfsShowDetails) then exit;
       if(CheckBoxInfinity.Checked=true) then
       begin
           DateEndEdit.Date                := max_date;
           DateEndEdit.Properties.ReadOnly := true;
           PercentBox.ItemIndex            :=0;
       end
       else
       begin
           DateEndEdit.Date                := DateBegEdit.Date;
           DateEndEdit.Properties.ReadOnly := false;
       end;
end;

procedure TfmManHospControl.SeriaEditKeyPress(Sender: TObject;
  var Key: Char);
begin
 if (PParameter.AControlFormStyle = zcfsShowDetails) then key :=chr(0);
end;

procedure TfmManHospControl.ListComboBoxPropertiesChange(Sender: TObject);
begin
     if (PParameter.AControlFormStyle = zcfsShowDetails) then exit;
end;

procedure TfmManHospControl.ListComboBoxPropertiesPopup(Sender: TObject);
begin
     if (PParameter.AControlFormStyle = zcfsShowDetails) then exit;
end;

procedure TfmManHospControl.ListComboBoxPropertiesNewLookupDisplayText(
  Sender: TObject; const AText: TCaption);
begin
     if (PParameter.AControlFormStyle = zcfsShowDetails) then exit;
end;

procedure TfmManHospControl.ShiftSpinPropertiesChange(Sender: TObject);
begin
     if (PParameter.AControlFormStyle = zcfsShowDetails) then exit;
     WorkingDaysList;
end;

procedure TfmManHospControl.PercentBoxPropertiesChange(Sender: TObject);
begin
   if(CheckBoxInfinity.Checked=true)  then  PercentBox.ItemIndex :=0;
end;

end.
