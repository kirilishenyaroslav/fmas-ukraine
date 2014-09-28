unit ManComandUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, StdCtrls, Buttons, PersonalCommon, SpCommon,
  Mask, CheckEditUnit, ComCtrls, ExtCtrls, Grids, DBGrids, FieldControl, EditControl,
  SpComboBox, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, cxDBData, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, DBCtrls;

type
  TManComandForm = class(TForm)
    ResultQuery: TIBQuery;
    WriteQuery: TIBQuery;
    BottomPanel: TPanel;
    CancelButton: TBitBtn;
    OkButton: TBitBtn;
    ResultQuery2: TIBQuery;
    DataSource2: TDataSource;
    ResultQueryID_MAN_COMAND_PLAN: TIntegerField;
    ResultQueryID_PCARD: TIntegerField;
    ResultQueryFIO: TIBStringField;
    ResultQueryTARGET: TIBStringField;
    ResultQueryOSNOVANIE: TIBStringField;
    ResultQueryPROEZD: TIBStringField;
    ResultQueryID_VIDOPL: TIntegerField;
    ResultQueryNAME_VIDOPL: TIBStringField;
    ResultQueryDATE_BEG: TDateField;
    ResultQueryDATE_END: TDateField;
    OrderItemsButton: TBitBtn;
    EditPageControl: TPageControl;
    HeaderSheet: TTabSheet;
    CitySheet: TTabSheet;
    ButtonsPanel: TPanel;
    AddButton: TSpeedButton;
    ModifyButton: TSpeedButton;
    DeleteButton: TSpeedButton;
    DogSheet: TTabSheet;
    GroupBox: TGroupBox;
    Label1: TLabel;
    SelectPersonButton: TSpeedButton;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    FioFC: TFieldControl;
    TargetFC: TFieldControl;
    OsnovanieFC: TFieldControl;
    ProezdFC: TFieldControl;
    Label6: TLabel;
    FC_VOPL: TFieldControl;
    Label7: TLabel;
    Label8: TLabel;
    FIOEdit: TEdit;
    TargetEdit: TCheckEdit;
    ProezdEdit: TEdit;
    OsnovanieEdit: TCheckEdit;
    VoplComboBox: TSpComboBox;
    DateBeg: TDateTimePicker;
    DateEnd: TDateTimePicker;
    CityGrid: TcxGrid;
    CityGridDBTableView1: TcxGridDBTableView;
    CityGridDBTableView1DBColumn1: TcxGridDBColumn;
    CityGridDBTableView1DBColumn2: TcxGridDBColumn;
    CityGridDBTableView1DBColumn3: TcxGridDBColumn;
    CityGridLevel1: TcxGridLevel;
    CityGridDBTableView1DBColumn4: TcxGridDBColumn;
    Label5: TLabel;
    FieldControl1: TFieldControl;
    SPZBox: TSpComboBox;
    ResultQueryID_SPZ: TIntegerField;
    ResultQueryNAME_SPZ: TIBStringField;
    SmetaButtonsPanel: TPanel;
    AddSmetaButton: TSpeedButton;
    ModifySmetaButton: TSpeedButton;
    DeleteSmetaButton: TSpeedButton;
    SmetaGrid: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    SmetaQuery: TIBQuery;
    SmetaDataSource: TDataSource;
    SmetaQueryID_MAN_COMAND_SMET: TLargeintField;
    SmetaQueryID_SMETA: TLargeintField;
    SmetaQueryID_RAZDEL: TLargeintField;
    SmetaQueryID_ST: TLargeintField;
    SmetaQueryID_KEKV: TLargeintField;
    SmetaQueryPERCENT: TIntegerField;
    SmetaQueryDATE_BEG: TDateField;
    SmetaQueryDATE_END: TDateField;
    SmetaQueryKOD_SMETA: TIntegerField;
    SmetaQueryKOD_RAZD: TIntegerField;
    SmetaQueryKOD_ST: TIntegerField;
    cxGridDBTableView1DBColumn1: TcxGridDBColumn;
    cxGridDBTableView1DBColumn2: TcxGridDBColumn;
    cxGridDBTableView1DBColumn3: TcxGridDBColumn;
    cxGridDBTableView1DBColumn4: TcxGridDBColumn;
    cxGridDBTableView1DBColumn5: TcxGridDBColumn;
    cxGridDBTableView1DBColumn6: TcxGridDBColumn;
    cxGridDBTableView1DBColumn7: TcxGridDBColumn;
    SmetaQueryKOD_KEKV: TIntegerField;
    InsertSmetaQuery: TIBQuery;
    DeleteSmetaQuery: TIBQuery;
    UpdateSmetaQuery: TIBQuery;
    InsertSmetaQueryID_MAN_COMAND_SMET: TLargeintField;
    SpeedButton4: TSpeedButton;
    Label9: TLabel;
    SmetaQueryDOG_STATUS: TIBStringField;
    DogStatus: TDBText;
    ResultQuery2ID_MAN_COMAND_PLAN_DET: TIntegerField;
    ResultQuery2DATE_BEG: TDateField;
    ResultQuery2DATE_END: TDateField;
    ResultQuery2MESTO: TIBStringField;
    ResultQuery2MESTO2: TIBStringField;
    CityGridDBTableView1DBColumn5: TcxGridDBColumn;
    ResultQuery2ORG_NAME: TIBStringField;
    procedure SelectPersonButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure prepare;
    procedure OkButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AddButtonClick(Sender: TObject);
    procedure ModifyButtonClick(Sender: TObject);
    procedure DeleteButtonClick(Sender: TObject);
    procedure OrderItemsButtonClick(Sender: TObject);
    procedure AddSmetaButtonClick(Sender: TObject);
    procedure DeleteSmetaButtonClick(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
  private
    { Private declarations }
  public
    //In
    FMode           : TEditMode;
    ID_ORDER        : Integer;
    NUM_ITEM        : Integer;
    ID_ORDER_TYPE   : Integer;
    ORDER_DATE      : TDATE;
    NUM_ORDER       : String;
    Note_Order      : String;

    MainEditControl : TEditControl;

    //Out
    ID_PCARD            : Integer;
    ID_MAN_COMAND_PLAN  : Integer;
  end;

var
  ManComandForm: TManComandForm;

implementation

uses GoodFunctionsUnit, SpFormUnit, AddManComandPlanDet, DtManBonusItemsUnit, AddForm,
  MainUnit;

{$R *.dfm}

procedure TManComandForm.prepare;
begin

	MainEditControl := TEditControl.Create;

	MainEditControl.Add([FioFC, TargetFC, OsnovanieFC, ProezdFC]);

    if FMode = emNew
    then begin
        ID_PCARD := -1;

        FioEdit.Text := '';
        TargetEdit.Text := '';
        OsnovanieEdit.Text := '';
        ProezdEdit.Text := '';
        CitySheet.TabVisible := false;
        DogSheet.TabVisible := false;

        DateBeg.Date := Date;
        DateEnd.Date := Date;

        VoplComboBox.Prepare(26812,'2.1.6.Оплата праці за час перебування у відрядженні');
        SpzBox.LoadFromRegistry;

        Caption := Caption + ' (нове)';
    end;

    if FMode = emModify
    then Caption := Caption + ' (редагування)';

    if FMode = emView
    then begin
        Caption := Caption + ' (перегляд)';
        GroupBox.Enabled := False;
        OkButton.Visible := False;
        CancelButton.Caption := 'Закрити';
        //CancelButton.Left := 168;

        ButtonsPanel.Visible := false;
    end;

    if (FMode = emModify) or (FMode = emView)
    then begin
        CitySheet.TabVisible := True;
        DogSheet.TabVisible := True;

        OrderItemsButton.Visible := True;

        ResultQuery.Close;
        ResultQuery.Params.ParamValues['ID_ORDER'] := ID_ORDER;
        ResultQuery.Open;

        ID_MAN_COMAND_PLAN := ResultQueryID_MAN_COMAND_PLAN.Value;
        ID_PCARD := ResultQueryID_PCARD.Value;

        VoplComboBox.Prepare(ResultQueryID_VIDOPL.Value, ResultQueryNAME_VIDOPL.Value);

        if ResultQueryDATE_BEG.Value <> 0 then
            DateBeg.Date := ResultQueryDATE_BEG.Value
        else
            DateBeg.Date := Date;

        if ResultQueryDATE_END.Value <> 0 then
            DateEnd.Date := ResultQueryDATE_END.Value
        else
            DateEnd.Date := Date;

        if (ResultQueryID_SPZ.Value <> 0) then
            SpzBox.Prepare(ResultQueryID_SPZ.Value, ResultQueryNAME_SPZ.Value)
        else
            SpzBox.Prepare(-1, '');

        ResultQuery2.Close;
        ResultQuery2.Params.ParamValues['ID_MAN_COMAND_PLAN'] := ID_MAN_COMAND_PLAN;
        ResultQuery2.Open;

        SmetaQuery.Close;
        SmetaQuery.Params.ParamValues['ID_MAN_COMAND_PLAN'] := ID_MAN_COMAND_PLAN;
        SmetaQuery.Open;

    end;

    MainEditControl.Prepare(Fmode);

end;

procedure TManComandForm.SelectPersonButtonClick(Sender: TObject);
var
    new_id_pcard : Integer;
begin

    new_id_pcard := getpcard(ORDER_DATE);

  if new_id_pcard <> -1 then begin
      ID_PCARD := new_id_pcard;
      FIOEdit.Text := GoodFunctionsUnit.Fam;
  end;

end;

procedure TManComandForm.FormCreate(Sender: TObject);
begin
    ResultQuery.Transaction := PersonalCommon.ReadTransaction;
    ResultQuery2.Transaction := PersonalCommon.ReadTransaction;
    SmetaQuery.Transaction := PersonalCommon.ReadTransaction;
    WriteQuery.Transaction := PersonalCommon.WriteTransaction;
    InsertSmetaQuery.Transaction := PersonalCommon.WriteTransaction;
    UpdateSmetaQuery.Transaction := PersonalCommon.WriteTransaction;
    DeleteSmetaQuery.Transaction := PersonalCommon.WriteTransaction;

    EditPageControl.ActivePageIndex := 0;
end;

procedure TManComandForm.OkButtonClick(Sender: TObject);
begin

    if (ID_PCARD = -1)
    then begin
        MessageDlg('Потрібно вибрати працівника!',mtError,[mbOk],0);
        Exit;
    end;

    MainEditControl.Read;

    if not MainEditControl.CheckFill then exit;


    if (VoplComboBox.GetId = -1)
    then begin
        MessageDlg('Потрібно вибрати вид оплати!',mtError,[mbOk],0);
        VoplComboBox.SetFocus;
        Exit;
    end;

    if (SpzBox.GetId = -1)
    then begin
        MessageDlg('Потрібно вибрати ШПЗ!',mtError,[mbOk],0);
        SpzBox.SetFocus;
        Exit;
    end;

    if (DateEnd.Date < DateBeg.Date)
    then begin
        MessageDlg('Дата кінця відрядження повинна бути більше дати початку!',mtError,[mbOk],0);
        Exit;
    end;

    if FMode = emNew then begin

        PersonalCommon.WriteTransaction.StartTransaction;

        try
            WriteQuery.Close;
            WriteQuery.SQL.Text := 'SELECT NEW_ID_ORDER FROM INSERT_ORDER(0,' + IntToStr(ID_ORDER_TYPE) + ',' + QuotedStr(Num_ORDER) + ',''' + DateToStr(Order_DATE) +''',' + QuotedStr(NOTE_ORDER) + ',' + IntToStr(1) + ');';
            ID_ORDER := ExecQuery(WriteQuery);

            WriteQuery.Close;
            WriteQuery.SQL.Text := 'SELECT ID_MAN_COMAND_PLAN FROM DT_MAN_COMAND_PLAN_INSERT(' + IntToStr(ID_PCARD) + ','
                                                                                               + IntToStr(ID_ORDER) + ','
                                                                                               + QuotedStr(TARGETEdit.Text) + ','
                                                                                               + QuotedStr(OSNOVANIEEdit.Text) + ','
                                                                                               + QuotedStr(PROEZDEdit.Text) + ','
                                                                                               + IntToStr(VoplComboBox.GetId) + ','
                                                                                               + QuotedStr(DateToStr(DateBeg.Date)) + ','
                                                                                               + QuotedStr(DateToStr(DateEnd.Date)) + ','
                                                                                               + IntToStr(SpzBox.GetId) + ')';
            ID_MAN_COMAND_PLAN := ExecQuery(WriteQuery);

        except on E:exception
            do begin
                PersonalCommon.WriteTransaction.Rollback;
                ModalResult := mrNone;
                MessageDlg('При занесенні данних у базу виникла помилка: ' + E.Message ,mtError,[mbOk],0);
                exit;
            end;
        end;

        PersonalCommon.WriteTransaction.Commit;

        CitySheet.TabVisible := True;
        DogSheet.TabVisible := True;
        OrderItemsButton.Visible := True;

        FMode := emModify;

        ResultQuery2.Close;
        ResultQuery2.Params.ParamValues['ID_MAN_COMAND_PLAN'] := ID_MAN_COMAND_PLAN;
        ResultQuery2.Open;

        SmetaQuery.Close;
        SmetaQuery.Params.ParamValues['ID_MAN_COMAND_PLAN'] := ID_MAN_COMAND_PLAN;
        SmetaQuery.Open;

        exit;

    end;

    if FMode = emModify then begin
        WriteQuery.Close;
        WriteQuery.SQL.Text := 'EXECUTE PROCEDURE DT_MAN_COMAND_PLAN_UPDATE(' + IntToStr(ID_MAN_COMAND_PLAN) + ','
                                                                              + IntToStr(ID_PCARD) + ','
                                                                              + IntToStr(ID_ORDER) + ','
                                                                              + QuotedStr(TARGETEdit.Text) + ','
                                                                              + QuotedStr(OSNOVANIEEdit.Text) + ','
                                                                              + QuotedStr(PROEZDEdit.Text) + ','
                                                                              + IntToStr(VoplComboBox.GetId) + ','
                                                                              + QuotedStr(DateToStr(DateBeg.Date)) + ','
                                                                              + QuotedStr(DateToStr(DateEnd.Date)) + ','
                                                                              + IntToStr(SpzBox.GetId) + ')';
        ExecQuery(WriteQuery);

        ModalResult := mrOk;
    end;

    
end;

procedure TManComandForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    SpzBox.SaveIntoRegistry;
    MainEditControl.Free;
end;

procedure TManComandForm.AddButtonClick(Sender: TObject);
var
    Form  : TAddManComandPlanDetForm;
    Date1 : TDate;
begin
    if ResultQuery2.IsEmpty
    then
        Date1 := Order_Date
    else begin
        ResultQuery2.Last;
        Date1 := ResultQuery2DATE_END.Value  + 1;
    end;

    Form := TAddManComandPlanDetForm.Create(Self,'','',date1,date1,-1,ID_MAN_COMAND_PLAN);

    if Form.ShowModal = mrOk
    then begin
        ResultQuery2.Close;
        ResultQuery2.Open;
    end;

    Form.Free;
end;

procedure TManComandForm.ModifyButtonClick(Sender: TObject);
var
    Form  : TAddManComandPlanDetForm;
begin
    if ResultQuery2.IsEmpty
    then begin
        MessageDlg('Немає записів!',mtError, [mbOk], 0);
        Exit;
    end;

    Form := TAddManComandPlanDetForm.Create(Self,
                                            ResultQuery2MESTO.Value,
                                            ResultQuery2MESTO2.Value,
                                            ResultQuery2DATE_BEG.Value,
                                            ResultQuery2DATE_END.Value,
                                            ResultQuery2ID_MAN_COMAND_PLAN_DET.Value,
                                            ID_MAN_COMAND_PLAN);

    if Form.ShowModal = mrOk
    then begin
        ResultQuery2.Close;
        ResultQuery2.Open;
    end;

    Form.Free;
end;

procedure TManComandForm.DeleteButtonClick(Sender: TObject);
begin
    if ResultQuery2.IsEmpty
    then begin
        MessageDlg('Немає записів!',mtError, [mbOk], 0);
        Exit;
    end;

    if MessageDlg('Чи ви справді бажаєте вилучити цей запис?', mtConfirmation, [mbYes, mbNo], 0) = ID_NO
        then exit;

    WriteQuery.Close;
    WriteQuery.SQL.Text := 'EXECUTE PROCEDURE DT_MAN_COMAND_PLAN_DET_DELETE(' + IntToStr(ResultQuery2ID_MAN_COMAND_PLAN_DET.Value) + ')';
    ExecQuery(WriteQuery);

    ResultQuery2.Close;
    ResultQuery2.Open;
end;

procedure TManComandForm.OrderItemsButtonClick(Sender: TObject);
var
    form : TDtManBonusItemsForm;
begin
    Form := TDtManBonusItemsForm.Create(self);
    Form.id_order := ID_ORDER;
    Form.OkButton.Visible := False;
    Form.FMode := FMode;
    Form.aID_TYPE := 19;
    Form.Prepare;

    Form.ShowModal;

    Form.Free;
end;

procedure TManComandForm.AddSmetaButtonClick(Sender: TObject);
var
    res : Variant;
    aDateBeg, aDateEnd : TDate;
    aPercent : Integer;
    new_id : Integer;
begin

    if SmetaQuery.IsEmpty then begin
        aDateBeg := DateBeg.Date;
        aPercent := 100;
    end
    else begin
        SmetaQuery.Last;
        aDateBeg := SmetaQueryDATE_END.Value + 1;
        aPercent := 0;
    end;

    aDateEnd := DateEnd.Date;

    res := AddKosht(Self, main.FibDatabase.Handle, aDateBeg, aDateEnd, aPercent);

    if (not VarIsNull(res)) and not(VarType(res) = Unassigned) then begin
        InsertSmetaQuery.Close;

        InsertSmetaQuery.Params.ParamValues['id_smeta'] := Res[0][7];
        InsertSmetaQuery.Params.ParamValues['id_razdel'] := Res[0][8];
        InsertSmetaQuery.Params.ParamValues['id_st'] := Res[0][9];
        InsertSmetaQuery.Params.ParamValues['id_kekv'] := Res[0][10];
        InsertSmetaQuery.Params.ParamValues['percent'] := Res[0][3];
        InsertSmetaQuery.Params.ParamValues['id_man_comand'] := Id_Man_Comand_Plan;
        InsertSmetaQuery.Params.ParamValues['date_beg'] := Res[0][13];
        InsertSmetaQuery.Params.ParamValues['date_end'] := Res[0][14];

        new_id := ExecQuery(InsertSmetaQuery);

        SmetaQuery.Close;
        SmetaQuery.Open;
        SmetaQuery.Locate('ID_MAN_COMAND_SMET', new_id, []);
    end;
end;

procedure TManComandForm.DeleteSmetaButtonClick(Sender: TObject);
begin
    if not CheckQueryForDel(SmetaQuery) then exit;

    DeleteSmetaQuery.Close;
    DeleteSmetaQuery.Params.ParamValues['ID_MAN_COMAND_SMET'] := IntToStr(SmetaQueryID_MAN_COMAND_SMET.Value);
    ExecQuery(DeleteSmetaQuery);

    SmetaQuery.Close;
    SmetaQuery.Open;
end;

procedure TManComandForm.SpeedButton4Click(Sender: TObject);
var
    Form : TSpForm;
    Params : TSpParams;
begin
    Form := TSpForm.Create(Self);
    Params := TSpParams.Create;

    Params.Table := 'DT_MAN_COMAND_SMET_DOG(' + IntToStr(Id_Order) + ', 0)';
    Params.IdField := 'id_record';
    Params.SpFields := 'txt_error';
    Params.Title := 'Помилки при спробі створити (оновити) договір';
    Params.ColumnNames := 'Текст помилки';
    Params.ReadOnly := True;

    Form.Init(Params);

    if not Form.ResultQuery.IsEmpty then begin
        Form.ShowModal;
        Form.ResultQuery.Transaction.Rollback;
    end
    else begin
        Form.ResultQuery.Transaction.Commit;
        SmetaQuery.Close;
        SmetaQuery.Open;
    end;

    Form.Free;
    Params.Free;
end;

end.
