{******************************************************************************}
{               Автоматизированная система управления персоналом               }
{                                                                              }
{               (c) Донецкий национальный университет, 2002-2004               }
{******************************************************************************}

{                      Пакет "Справочник надбавок"                             }
{                 Работа со справочником надбавок                              }
{                                               ответственный: Тимофеев Антон  }
unit U_SP_Raise;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, Grids, DBGrids, uSearchFrame, ExtCtrls, U_SPRaise_DataModule, DB,
    U_SP_Raise_Add, Buttons, RxMemDS, FIBDatabase, pFIBDatabase,
    IBase, SpCommon, ComCtrls, U_SP_Raise_Del, U_SP_Raise_History, cxStyles,
    cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit,
    cxDBData, cxGridLevel, cxClasses, cxControls, cxGridCustomView, U_SP_Raise_AddType,
    cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
    cxCurrencyEdit, StdCtrls, ActnList, Placemnt, cxContainer, cxCheckBox,
  cxTextEdit;

type
    TSP_Raise = class(TForm)
        Panel1: TPanel;
        DataSource: TDataSource;
        SBAdd: TSpeedButton;
        SBModif: TSpeedButton;
        SBDelete: TSpeedButton;
        SBMore: TSpeedButton;
        SBSelect: TSpeedButton;
        SBClose: TSpeedButton;
        SBRefresh: TSpeedButton;
        SB_History: TSpeedButton;
        RaisesView: TcxGridDBTableView;
        DBGridLevel1: TcxGridLevel;
        DBGrid: TcxGrid;
        RaisesViewDBColumn1: TcxGridDBColumn;
        RaisesViewDBColumn3: TcxGridDBColumn;
        RaisesViewDBColumn4: TcxGridDBColumn;
        RaisesViewDBColumn5: TcxGridDBColumn;
        RaisesViewDBColumn6: TcxGridDBColumn;
        RaisesViewDBColumn8: TcxGridDBColumn;
        SpeedButton_AddGroup: TSpeedButton;
        SpeedButton_UpdateGroup: TSpeedButton;
        SpeedButton_DeleteGroup: TSpeedButton;
        Panel2: TPanel;
        DP_Date: TDateTimePicker;
        Label1: TLabel;
        RaisesViewDBColumn2: TcxGridDBColumn;
        RaisesViewDBColumn7: TcxGridDBColumn;
        cxSR: TcxStyleRepository;
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
        ActionList1: TActionList;
        AddRaise: TAction;
        ModifyRaise: TAction;
        DeleteRaise: TAction;
        RefreshRaise: TAction;
        MoreInfo: TAction;
        History: TAction;
        AddType: TAction;
        ModifType: TAction;
        DelType: TAction;
        Action1: TAction;
        Panel3: TPanel;
        Label2: TLabel;
        SearchEdit: TEdit;
        Label3: TLabel;
        cxCheckBox1: TcxCheckBox;
        cxCheckBox2: TcxCheckBox;
        RaisesViewDBColumn9: TcxGridDBColumn;
        SpeedButton1: TSpeedButton;
        FormStorage1: TFormStorage;
        RaisesViewDBColumn11: TcxGridDBColumn;
        cxgrdbclmnRaisesViewDBColumn10: TcxGridDBColumn;
        procedure SBMoreClick(Sender: TObject);
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
        procedure SBSelectClick(Sender: TObject);
        procedure SBCloseClick(Sender: TObject);
        procedure DBGridDblClick(Sender: TObject);
        procedure SB_HistoryClick(Sender: TObject);
        procedure SpeedButton_DeleteGroupClick(Sender: TObject);
        procedure SpeedButton_UpdateGroupClick(Sender: TObject);
        procedure SpeedButton_AddGroupClick(Sender: TObject);
        procedure RaisesViewCustomDrawCell(
            Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
            AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
        procedure FormShow(Sender: TObject);
        procedure FormDestroy(Sender: TObject);
        procedure RaisesViewDblClick(Sender: TObject);
        procedure RaisesViewKeyDown(Sender: TObject; var Key: Word;
            Shift: TShiftState);
        procedure AddRaiseExecute(Sender: TObject);
        procedure ModifyRaiseExecute(Sender: TObject);
        procedure DeleteRaiseExecute(Sender: TObject);
        procedure RefreshRaiseExecute(Sender: TObject);
        procedure DP_DateChange(Sender: TObject);
        procedure Action1Execute(Sender: TObject);
        procedure SearchEditChange(Sender: TObject);
        procedure RaisesViewKeyPress(Sender: TObject; var Key: Char);
        procedure cxCheckBox1PropertiesChange(Sender: TObject);
        procedure cxCheckBox2PropertiesChange(Sender: TObject);
        procedure SpeedButton1Click(Sender: TObject);
    private
        procedure ModifRaise;
        procedure DelRaise;
    public
        DMod: TDMSPRaise;
        Input: TRxMemoryData;
        Output: TRxMemoryData;
        constructor Create(AOwner: TComponent; DataModule: TDMSPRaise;
            Input: TRxMemoryData = nil; Output: TRxMemoryData = nil); reintroduce;
    { Public declarations }
    end;

type TShowMode = (smShowMod, smShowMChild, smSelMod, smSelMChild, smMSelMod, smMSelMChild);
    TFormBtn = (fbAdd, fbModif, fbDel);
    TFormButtons = set of TFormBtn;

const fbAll = [fbAdd, fbModif, fbDel];

implementation

uses USpAbsGroup;

{$R *.dfm}

constructor TSP_Raise.Create(AOwner: TComponent; DataModule: TDMSPRaise; Input: TRxMemoryData = nil; Output: TRxMemoryData = nil);
begin
    inherited Create(AOwner);
    Self.DMod := DataModule;
    Self.Input := Input;
    Self.Output := Output;

    if Input <> nil then
    begin
        SBSelect.Visible := (Input['Select'] <> 0);
        if Input['Select'] = 2 then
            RaisesView.OptionsSelection.MultiSelect := True;
    end;
end;

procedure TSP_Raise.SpeedButton_DeleteGroupClick(
    Sender: TObject);
begin
    if DMod.FIBDataSet.IsEmpty then
        MessageDlg('Не можливо видалити запис бо довідник пустий', mtError, [mbYes], 0)
    else
    begin
    if (MessageDlg('Ви бажаєте вилучити тип "' + DMod.FIBDataSet['type_Name'] + '"?', mtConfirmation, [mbYes, mbNo], 0) = mrNo) then Exit;
        if (MessageDlg('Ви впевнені, що бажаєте вилучити тип "' + DMod.FIBDataSet['type_Name'] + '"?', mtConfirmation, [mbYes, mbNo], 0) = mrNo) then Exit;

    with DMod do
        try
            FIBWriteTransaction.StartTransaction;
            FIBQuery.SQL.Text := 'execute procedure ini_type_raise_D(' + IntToStr(FIBDataSet['Id_type']) + ');';
            FIBQuery.ExecProc;
            FIBWriteTransaction.Commit;
        except on e: Exception do
            begin
                MessageDlg('Не вдалося вилучити запис: ' + e.Message, mtError, [mbYes], 0);
                FIBWriteTransaction.RollBack;
            end;
        end;
        SBRefresh.Click;
    end;
end;

procedure TSP_Raise.SpeedButton_AddGroupClick(Sender: TObject);
var Form_Change_Group: TSPRaise_AddGr;
begin
    Form_Change_Group := TSPRaise_AddGr.Create(Self);
    Form_Change_Group.DMod := DMod;
    Form_Change_Group.Add := True;
    Form_Change_Group.Caption := 'Додати тип';
    Form_Change_Group.ShowModal;
    SBRefresh.Click;
end;

procedure TSP_Raise.SpeedButton_UpdateGroupClick(
    Sender: TObject);
var Form_Change_Group: TSPRaise_AddGr;
begin
    if DMod.FIBDataSet.IsEmpty then
        MessageDlg('Не можливо змінити запис бо довідник пустий', mtError, [mbYes], 0)
    else
    begin
        if (MessageDlg('Чи ви справді бажаєте змінити назву типу: "' +
            DMod.FIBDataSet['type_name'] + '"?', mtConfirmation, [mbYes, mbNo], 0) = mrNo) then Exit;
        Form_Change_Group := TSPRaise_AddGr.Create(Self);
        Form_Change_Group.DMod := DMod;
        Form_Change_Group.Id := DMod.FIBDataSet['Id_type'];
        Form_Change_Group.CE_Name.Text := DMod.FIBDataSet['type_name'];
        Form_Change_Group.Add := False;
        Form_Change_Group.ShowModal;
        SBRefresh.Click;
    end;
end;

procedure TSP_Raise.ModifRaise;
var FormAdd: TSP_Raise_Add;
begin
    if DMod.FIBDataSet['Id_raise'] = Null then
    begin
        MessageDlg('Не можливо змінити пустий запис', mtError, [mbYes], 0);
        Exit;
    end;
    FormAdd := TSP_Raise_Add.Create(Self, DMod.FIBDataSet['id_calc_type'] - 1);
    FormAdd.DMod := DMod;
    with FormAdd do
    begin
      try
        Add := False;
        Caption := 'Змінити надбавку';
        date_beg := DMod.FIBDataSet['use_date_beg'];
        date_end := DMod.FIBDataSet['use_date_end'];

        if (not VarIsNull(DMod.FIBDataSet['id_vidopl'])) then
            BonusBox.Prepare(DMod.FIBDataSet['id_vidopl'], DMod.FIBDataSet['vo_name']);

        TypeBox.Prepare(DMod.FIBDataSet['id_type'], DMod.FIBDataSet['type_name']);

        If VarIsNull(DMod.FIBDataSet['Reason']) then ReasonText.Text:=''
        else ReasonText.Text:=DMod.FIBDataSet['Reason'];

        if VarIsNull(DMod.FIBDataSet['STIMUL_BONUS']) then  chStimulBonus.Checked:=false
        else
        begin
           if DMod.FIBDataSet['STIMUL_BONUS']='T' then chStimulBonus.Checked:=true
           else chStimulBonus.Checked:=false;
        end;

        if VarIsNull(DMod.FIBDataSet['IS_PROLONG']) then chIsProlong.Checked:=false
        else
        begin
           if DMod.FIBDataSet['IS_PROLONG']='T' then chIsProlong.Checked:=true
           else chIsProlong.Checked:=false;
        end;
        
        if (not VarIsNull(DMod.FIBDataSet['ID_ABSORBE_GROUP']))
        then AbsorbeGroup.Prepare(DMod.FIBDataSet['ID_ABSORBE_GROUP'],DMod.FIBDataSet['ABSORBE_GROUP_TITLE']);

        if (not VarIsNull(DMod.FIBDataSet['ABSORBE_PRIORITY']))
        then AbsorbePriority.Text:=VarToStr(DMod.FIBDataSet['ABSORBE_PRIORITY']);

        if (not VarIsNull(DMod.FIBDataSet['MAY_BEE_DOUBLE_IN_GROUP']))
        then MayBeeMoreThanOnce.Checked:=Boolean(DMod.FIBDataSet['MAY_BEE_DOUBLE_IN_GROUP'])
        else MayBeeMoreThanOnce.Checked:=false;

        if (not VarIsNull(DMod.FIBDataSet['DISPLAY_ORDER']))
        then DisplayOrder.Value:=DMod.FIBDataSet['DISPLAY_ORDER']
        else DisplayOrder.Value:=High(Integer);


        if DMod.FIBDataSet['is_raise_last'] = 'F' then
        begin
             RB_New.Enabled := False;
             CanDateCor := False;
             DT_DateBeg.Enabled := False;
             DT_DateEnd.Enabled := False;
        end
        else
            CanDateCor := True;

        DT_DateBeg.Date := date_beg;
        DT_DateEnd.Date := date_end;
        id := IntToStr(DMod.FIBDataSet['Id_raise']);
        CE_Name.Text := DMod.FIBDataSet['Name'];
        M_full.Text := DMod.FIBDataSet['Full_name'];
        if (StrToFloat(DMod.FIBDataSet['raise_min']) = StrToFloat(DMod.FIBDataSet['raise_max'])) then
        begin
            FixRadio.Checked := True;
            CE_One.Text := DMod.FIBDataSet['raise_min'];
            CE_Max.Enabled := False;
            CE_Min.Enabled := False;
            CE_Def.Enabled := False;
            CE_One.Enabled := True;
        end
        else
        begin
            RangeRadio.Checked := True;
            CE_Min.Text := DMod.FIBDataSet['raise_min'];
            CE_Max.Text := DMod.FIBDataSet['raise_max'];
            CE_Def.Text := DMod.FIBDataSet['raise_default'];
            CE_Max.Enabled := True;
            CE_Min.Enabled := True;
            CE_Def.Enabled := True;
            CE_One.Enabled := False;
        end;
        if DMod.FIBDataSet['special'] = 'T' then CB_Spec.Checked := True;
        if DMod.FIBDataSet['PERCENTAL'] = 'T' then CB_Percental.Checked := True;
        if DMod.FIBDataSet['use_sm_okl'] = 'T' then CB_Use_sm_okl.Checked := True;
        if DMod.FIBDataSet['use_sht'] = 'T' then CB_Use_sht.Checked := True;
        if DMod.FIBDataSet['use_stavka'] = 'T' then CB_Use_stavka.Checked := True;
        if ShowModal = mrOk then DP_Date.Date := DT_DateBeg.Date;
        Free;
      except on e:exception
      do showmessage(e.message);
      end;
    end;
end;

procedure TSP_Raise.DelRaise;
var F_Del: TF_SP_Raise_Del;
begin
    if DMod.FIBDataSet['is_raise_last'] = 'F' then
    begin
        MessageDlg('Не можливо видалити закритий запис!', mtError, [mbYes], 0);
        exit;
    end;

    if (MessageDlg('Чи ви справді бажаєте вилучити запис "' + DMod.FIBDataSet['Name'] +
        '"?', mtConfirmation, [mbYes, mbNo], 0) = mrNo) then Exit;

    F_Del := TF_SP_Raise_Del.Create(Self);
    F_Del.DMod := DMod;
    with F_Del do
    begin
        id_Raise := DMod.FIBDataSet['id_raise'];
        date_end_old := DMod.FIBDataSet['use_date_end'];
        date_beg := DMod.FIBDataSet['use_date_beg'];
        ShowModal;
        Free;
    end;
end;

procedure TSP_Raise.SBMoreClick(Sender: TObject);
var FD: TSP_Raise_Add;
    count: integer;
begin
    if DMod.FIBDataSet.IsEmpty then
    begin
        MessageDlg('Довідник пустий!', mtError, [mbYes], 0);
        exit;
    end;
    count := RaisesView.DataController.GetSelectedCount;
    if count > 0 then
        DMod.FIBDataSet.Locate('ID_raise', RaisesView.DataController.GetRecordId(RaisesView.Controller.SelectedRecords[count - 1].RecordIndex), []);
    FD := TSP_Raise_Add.Create(Self, DMod.FIBDataSet['id_calc_type'] - 1);
    FD.DMod := DMod;
    with FD do
    begin
        Caption := 'Детальна інформація';
        RB_Cor.Visible := False;
        RB_New.Visible := False;
        date_beg := DMod.FIBDataSet['use_date_beg'];
        date_end := DMod.FIBDataSet['use_date_end'];
        BonusBox.Prepare(DMod.FIBDataSet['id_vidopl'], DMod.FIBDataSet['vo_name']);
        TypeBox.Prepare(DMod.FIBDataSet['id_type'], DMod.FIBDataSet['type_name']);

        DT_DateBeg.Date := date_beg;
        DT_DateEnd.Date := date_end;
        id := IntToStr(DMod.FIBDataSet['Id_raise']);
        CE_Name.Text := DMod.FIBDataSet['Name'];
        M_full.Text := DMod.FIBDataSet['Full_name'];

        If VarIsNull(DMod.FIBDataSet['Reason']) then ReasonText.Text:=''
        else ReasonText.Text:=DMod.FIBDataSet['Reason'];

        if VarIsNull(DMod.FIBDataSet['STIMUL_BONUS']) then  chStimulBonus.Checked:=false
        else
        begin
           if DMod.FIBDataSet['STIMUL_BONUS']='T' then chStimulBonus.Checked:=true
           else chStimulBonus.Checked:=false;
        end;

        if VarIsNull(DMod.FIBDataSet['IS_PROLONG']) then  chIsProlong.Checked:=false
        else
        begin
           if DMod.FIBDataSet['IS_PROLONG']='T' then chIsProlong.Checked:=true
           else chIsProlong.Checked:=false;
        end;

        if (StrToFloat(DMod.FIBDataSet['raise_min']) = StrToFloat(DMod.FIBDataSet['raise_max'])) then
        begin
            FixRadio.Checked := True;
            CE_One.Text := DMod.FIBDataSet['raise_min'];
        end
        else
        begin
            RangeRadio.Checked := True;
            CE_Min.Text := DMod.FIBDataSet['raise_min'];
            CE_Max.Text := DMod.FIBDataSet['raise_max'];
            CE_Def.Text := DMod.FIBDataSet['raise_default'];
        end;
        if DMod.FIBDataSet['special'] = 'T' then CB_Spec.Checked := True;
        if DMod.FIBDataSet['PERCENTAL'] = 'T' then CB_Percental.Checked := True;
        if DMod.FIBDataSet['use_sm_okl'] = 'T' then CB_Use_sm_okl.Checked := True;
        if DMod.FIBDataSet['use_sht'] = 'T' then CB_Use_sht.Checked := True;
        if DMod.FIBDataSet['use_stavka'] = 'T' then CB_Use_stavka.Checked := True;

        DT_DateBeg.Enabled := False;
        DT_DateEnd.Enabled := False;
        BonusBox.Enabled   := False;
        TypeBox.Enabled    := False;
        CB_Spec.Enabled    := False;
        CB_Percental.Enabled  := False;
        CB_Use_SHT.Enabled    := False;
        CB_USE_SM_Okl.Enabled := False;
        CB_USE_Stavka.Enabled := False;
        CE_Name.Enabled := False;
        CE_Min.Enabled  := False;
        CE_Max.Enabled  := False;
        CE_Def.Enabled  := False;
        CE_One.Enabled  := False;
        M_full.Enabled  := False;
        CB_Calc_type.Enabled := False;
        SbOk.Enabled       := False;
        RangeRadio.Enabled := False;
        FixRadio.Enabled   := False;
        SbCancel.Caption   := 'Закрити';
        ReasonText.Enabled := False;
        chStimulBonus.Enabled := False;
        chIsProlong.Enabled   := False;
        AbsorbeGroup.Enabled  := False;
        MayBeeMoreThanOnce.Enabled := False;
        DisplayOrder.Block(True);
        ShowModal;
        Free;
    end;
end;

procedure TSP_Raise.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    if FormStyle = fsMDIChild then Action := caFree;
end;


procedure TSP_Raise.SBSelectClick(Sender: TObject);
var i, count: integer;
begin
    if DMod.FIBDataSet.IsEmpty then Exit;

    Output.Open;
    count := RaisesView.DataController.GetSelectedCount;
    if count > 1
    then begin
              with DMod.FIBDataSet do
              for i := 0 to count - 1 do
              begin
                   Output.Append;
                   Output['Id_Raise'] := StrToInt(RaisesView.Controller.SelectedRecords[i].Values[0]);
                   Output['Name'] := RaisesView.Controller.SelectedRecords[i].Values[1];
                   Output.Post;
              end;
              ModalResult := mrOk;
    end;

    if count = 1
    then begin
              Output.Append;
              Output['Id_Raise'] := StrToInt(RaisesView.Controller.SelectedRecords[0].Values[0]); ;
              Output['Name'] := RaisesView.Controller.SelectedRecords[0].Values[1];
              Output.Post;
              ModalResult := mrOk;
    end;
end;

procedure TSP_Raise.SBCloseClick(Sender: TObject);
begin
    ModalResult := mrCancel;
    Close;
end;

procedure TSP_Raise.DBGridDblClick(Sender: TObject);
begin
    SBSelect.Click;
end;

procedure TSP_Raise.SB_HistoryClick(Sender: TObject);
var F_Hist: TF_SP_Raise_Hist;
    count: integer;
begin
    if DMod.FIBDataSet.IsEmpty then
    begin
        MessageDlg('Довідник пустий!', mtError, [mbYes], 0);
        exit;
    end;

    count := RaisesView.DataController.GetSelectedCount;
    if count > 0 then
        DMod.FIBDataSet.Locate('ID_raise', StrToInt(RaisesView.Controller.SelectedRecords[count - 1].Values[7]), []); ;


    DMod.FIBDataSetHist.SelectSQL.Clear;
    DMod.FIBDataSetHist.SelectSQL.Add('select * from sp_raise_history(' + IntToStr(DMod.FIBDataSet['id_raise']) + ') order by use_date_beg;');
//  DMod.FIBDataSetHist.Open;


    F_Hist := TF_SP_Raise_Hist.Create(Self);
    F_Hist.DMod := DMod;
    F_Hist.ShowModal;
    F_Hist.Free;
    DMod.FIBDataSetHist.Close;

end;

procedure TSP_Raise.RaisesViewCustomDrawCell(
    Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
    AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
    Arect: TRect;
begin
    Arect := AViewInfo.Bounds;
    ACanvas.Canvas.Pen.Color := clBlack;
    if AViewInfo.GridRecord.Values[2] = 'F' then
    begin
        ACanvas.Canvas.Font.Color := clRed;
        ACanvas.Canvas.Font.Style := [fsStrikeOut];
        ACanvas.Canvas.FillRect(Arect);
    end
    else
    begin
        ACanvas.Canvas.Font.Color := clBlack;
        ACanvas.Canvas.Font.Style := [];
        ACanvas.Canvas.FillRect(Arect);
    end;
end;

procedure TSP_Raise.FormShow(Sender: TObject);
begin
    DataSource.DataSet := DMod.FIBDataSet;
    if not DMod.FIBDatabase.Connected then
    begin
        DMod.FIBDatabase.Open;
    end;
    if not DMod.FIBDataSet.Active then
        RefreshRaise.Execute;
//    if Input <> nil then
//        DP_Date.Date := Input['Actual_date'];
//    SearchFrame.Prepare(DMod.FIBDataSet, nil);
    DBGrid.SetFocus;
  //SpInit(DMod.FIBDatabase.Handle);
end;

procedure TSP_Raise.FormDestroy(Sender: TObject);
begin
  //SPDone;
  //DMod.Free;
end;

procedure TSP_Raise.RaisesViewDblClick(Sender: TObject);
begin
    if SBSelect.Visible then
        SBSelect.Click;
end;

procedure TSP_Raise.RaisesViewKeyDown(Sender: TObject;
    var Key: Word; Shift: TShiftState);
begin
    if Key = VK_return then RaisesViewDblClick(Sender);
    if Key = VK_BACK then SearchEdit.Text := Copy(SearchEdit.Text, 1,
      Length(SearchEdit.Text)-1);
//   else DBGridDBTableView1.DataController.LocateByKey(chr(Key))
end;

procedure TSP_Raise.AddRaiseExecute(Sender: TObject);
var FormAdd: TSP_Raise_Add;
begin
    FormAdd := TSP_Raise_Add.Create(Self, -1);
    FormAdd.DMod := DMod;
    with FormAdd do
    begin
          Add := True;
          RB_Cor.Visible := False;
          RB_New.Visible := False;
          Label7.Visible := True;
          Label8.Visible := True;
          DT_DateBeg.Enabled := True;
          DT_DateEnd.Enabled := True;

          if not VarIsNull(DMod.FIBDataSet['id_type'])
          then TypeBox.Prepare(DMod.FIBDataSet['id_type'], DMod.FIBDataSet['type_name']);

          if not VarIsNull(DMod.FIBDataSet['id_vidopl'])
          then BonusBox.Prepare(DMod.FIBDataSet['id_vidopl'], DMod.FIBDataSet['vo_name']);

          if ShowModal = mrOk
          then DP_Date.Date := DT_DateBeg.Date;

          Free;
    end;
    SBRefresh.Click;
    DBGrid.SetFocus;
end;

procedure TSP_Raise.ModifyRaiseExecute(Sender: TObject);
begin
    if DMod.FIBDataSet.IsEmpty
    then begin
              MessageDlg('Не можливо змінити запис бо довідник пустий', mtError, [mbYes], 0);
              exit;
    end;
    ModifRaise;
    SBRefresh.Click;
    DBGrid.SetFocus;
end;

procedure TSP_Raise.DeleteRaiseExecute(Sender: TObject);
begin
    if DMod.FIBDataSet.IsEmpty
    then begin
              MessageDlg('Не можливо видалити запис бо довідник пустий', mtError, [mbYes], 0);
              exit;
    end;

    DelRaise;

    SBRefresh.Click;
    DBGrid.SetFocus;
end;

procedure TSP_Raise.RefreshRaiseExecute(Sender: TObject);
var
    id: Variant;
    Raise_Select_Kind: Integer;
begin
    with DMod do
    begin
        RaisesView.BeginUpdate;

        id := Null;
        if FIBDataSet.Active then
            id := FIBDataSet['Id_raise'];

        if VarIsNull(Input['Raise_Select_Kind']) or
            VarIsEmpty(Input['Raise_Select_Kind']) then
            Raise_Select_Kind := 0
        else
            Raise_Select_Kind := Input['Raise_Select_Kind'];

        DP_Date.Date := Input['Actual_Date'];
        FIBDataSet.Close;
        FIBDataSet.SelectSQL.Clear;
        FIBDataSet.SelectSQL.Add('select * from sp_raise_s(' +
            IntToStr(Raise_Select_Kind) + ',' + QuotedStr(DateToStr(DP_Date.Date)) +
            ')');
        FIBDataSet.Open;

        if not VarIsNull(Id)
        then begin
                  FIBDataSet.Locate('Id_RAISE', Id, []);

        end;

        RaisesView.ViewData.Expand(true);

        RaisesView.EndUpdate;



    end;
end;

procedure TSP_Raise.DP_DateChange(Sender: TObject);
begin
    Input.Edit;
    Input['Actual_Date']:=DP_Date.Date;
    SBRefresh.Click;
end;

procedure TSP_Raise.Action1Execute(Sender: TObject);
begin
    ShowInfo(RaisesView.DataController.DataSource.DataSet);
end;

procedure TSP_Raise.SearchEditChange(Sender: TObject);
begin
  if (SearchEdit.Text = '')or(VarIsNull(SearchEdit.Text)) then
   begin
     RaisesView.DataController.DataSet.Filtered := False;
   end
  else
   begin
     try
       RaisesView.DataController.DataSet.Filtered := False;
       RaisesView.DataController.DataSet.Filter := '(not Full_name is null) and UPPER(Full_name) LIKE ''%' +
            AnsiUpperCase(SearchEdit.Text) + '%''';
       RaisesView.DataController.DataSet.Filtered := True;
       RaisesView.ViewData.Expand(False);
       RaisesView.DataController.SelectRows(0, 0);
//       ShowMessage(cxG_MainDBTableView1.DataController.DataSet.Filter);
     except
//       ShowMessage(cxG_MainDBTableView1.DataController.DataSet.Filter);
//       ShowInfo(cxG_MainDBTableView1.DataController.DataSet);
     end;
    end;
end;

procedure TSP_Raise.RaisesViewKeyPress(Sender: TObject;
  var Key: Char);
begin
  if ord(Key) > 31  then
    SearchEdit.Text := SearchEdit.Text + Key;
end;

procedure TSP_Raise.cxCheckBox1PropertiesChange(Sender: TObject);
var i:Integer;
begin
     for i:=0 to RaisesView.ColumnCount-1 do
     begin
          RaisesView.Columns[i].Options.Filtering:=cxCheckBox1.Checked;
     end;
end;

procedure TSP_Raise.cxCheckBox2PropertiesChange(Sender: TObject);
begin
      RaisesView.OptionsView.GroupByBox:=cxCheckBox2.Checked;
end;

procedure TSP_Raise.SpeedButton1Click(Sender: TObject);
var T:TfrmGetSpGroup;
begin
     T:=TfrmGetSpGroup.Create(self);
     T.ShowModal;
     T.Free;
end;

end.

