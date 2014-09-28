unit BsLgotClientEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, cxControls, cxContainer, cxEdit,
  cxLabel, StdCtrls, cxLookAndFeelPainters, cxButtons, cxCalendar, DB,
  FIBDataSet, pFIBDataSet, ExtCtrls, uCommon_Messages;

type
  TfrmLgotEdit = class(TForm)
    lblLgot: TcxLabel;
    LgotBox: TcxLookupComboBox;
    lblProc: TcxLabel;
    lblGroup: TcxLabel;
    GroupBox: TcxLookupComboBox;
    BoxLgots: TGroupBox;
    BoxFIO: TGroupBox;
    BoxCustomerService: TGroupBox;
    lblFirstName: TcxLabel;
    lblName: TcxLabel;
    lblPatronymic: TcxLabel;
    FirstNameBox: TcxLookupComboBox;
    NameBox: TcxLookupComboBox;
    PatrBox: TcxLookupComboBox;
    CustomerServiceBox: TcxLookupComboBox;
    lblCustomerService: TcxLabel;
    lblDate: TcxLabel;
    DateBeg: TcxDateEdit;
    DateEnd: TcxDateEdit;
    lblDateEnd: TcxLabel;
    NomerEdit: TcxTextEdit;
    lblNomer: TcxLabel;
    InnEdit: TcxTextEdit;
    lblInn: TcxLabel;
    btnOk: TcxButton;
    btnCancel: TcxButton;
    LgotDSet: TpFIBDataSet;
    GroupDSet: TpFIBDataSet;
    FirstNameDSet: TpFIBDataSet;
    NameDSet: TpFIBDataSet;
    PatrDSet: TpFIBDataSet;
    CustServDset: TpFIBDataSet;
    LgotDS: TDataSource;
    GroupDS: TDataSource;
    FirstNameDS: TDataSource;
    NameDS: TDataSource;
    PatrDS: TDataSource;
    CustServDS: TDataSource;
    TimerEdit: TTimer;
    PeriodsDSet: TpFIBDataSet;
    GetPersonPrivInfo: TpFIBDataSet;
    CustServiceEdit: TcxTextEdit;
    procedure TimerEditTimer(Sender: TObject);
    procedure LgotBoxEnter(Sender: TObject);
    procedure LgotBoxExit(Sender: TObject);
    procedure LgotBoxClick(Sender: TObject);
    procedure FirstNameBoxClick(Sender: TObject);
    procedure FirstNameBoxEnter(Sender: TObject);
    procedure FirstNameBoxExit(Sender: TObject);
    procedure NameBoxClick(Sender: TObject);
    procedure NameBoxEnter(Sender: TObject);
    procedure NameBoxExit(Sender: TObject);
    procedure PatrBoxClick(Sender: TObject);
    procedure PatrBoxEnter(Sender: TObject);
    procedure PatrBoxExit(Sender: TObject);
    procedure CustomerServiceBoxExit(Sender: TObject);
    procedure CustomerServiceBoxEnter(Sender: TObject);
    procedure CustomerServiceBoxClick(Sender: TObject);
    procedure LgotBoxKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FirstNameBoxKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure NameBoxKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure PatrBoxKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CustomerServiceBoxKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure LgotBoxPropertiesInitPopup(Sender: TObject);
    procedure FirstNameBoxPropertiesInitPopup(Sender: TObject);
    procedure NameBoxPropertiesInitPopup(Sender: TObject);
    procedure PatrBoxPropertiesInitPopup(Sender: TObject);
    procedure CustomerServiceBoxPropertiesInitPopup(Sender: TObject);
    procedure LgotBoxPropertiesChange(Sender: TObject);
  private
    { Private declarations }
    ContextInputType, LgotEditMode:SmallInt;
    MDateBeg, MDateEnd:TDate;
    function CheckData:Boolean;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent; KodMachineIn, IdPersonPriv:Integer; EditMode:SmallInt);reintroduce;
  end;

var
  frmLgotEdit: TfrmLgotEdit;

implementation

{$R *.dfm}

uses BsClient, cxLookupDBGrid;

constructor TfrmLgotEdit.Create(AOwner:Tcomponent; KodMachineIn, IdPersonPriv:Integer; EditMode:SmallInt);
var i:SmallInt;
begin
   //EditMode: 0 - добавление, 1 -редактирование, 2 - просмотр
   inherited Create(Aowner);
   LgotEditMode:=EditMode;
   if PeriodsDSet.Active then PeriodsDSet.Close;
   PeriodsDSet.SQLs.SelectSQL.Text:='SELECT MIN(DATE_BEG) AS MDATE_BEG, MAX(DATE_END) AS MDATE_END FROM BS_CLIENT_ACCOUNT WHERE KOD_MACHINE=:KOD';
   PeriodsDSet.ParamByName('KOD').AsInteger:=KodMachineIn;
   PeriodsDSet.Open;
   if not PeriodsDSet.IsEmpty then
   begin
      MDateBeg:=PeriodsDSet['MDATE_BEG'];
      MDateEnd:=PeriodsDSet['MDATE_END'];
   end;
   case EditMode of
     0: begin
           if IdPersonPriv=-1 then
           begin
              if GroupDSet.Active then GroupDSet.Close;
              GroupDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_SP_PERSON_PRIV_TYPE';
              GroupDSet.Open;
              GroupBox.EditValue:=1;
              GroupBox.Enabled:=False;
           end
           else
           begin
              if GroupDSet.Active then GroupDSet.Close;
              GroupDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_SP_PERSON_PRIV_TYPE WHERE ID_PERSON_PRIV_TYPE<>1';
              GroupDSet.Open;
              if GetPersonPrivInfo.Active then GetPersonPrivInfo.Close;
              GetPersonPrivInfo.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_PERSON_PRIVILEGES_DOC WHERE ID_PERSON_PRIV=:ID_PERSON_PRIV';
              GetPersonPrivInfo.ParamByName('ID_PERSON_PRIV').AsInteger:=IdPersonPriv;
              GetPersonPrivInfo.Open;
              if not GetPersonPrivInfo.IsEmpty then
              begin
                 if not VarIsNull(GetPersonPrivInfo['NUM_DOC']) then NomerEdit.Text:=GetPersonPrivInfo['NUM_DOC'];
                 NomerEdit.Enabled:=False;
                 if not VarIsNull(GetPersonPrivInfo['NAME_ORGANIZATION_DOC']) then CustServiceEdit.Text:=GetPersonPrivInfo['NAME_ORGANIZATION_DOC'];
                 CustServiceEdit.Enabled:=False;
                 DateBeg.Date:=GetPersonPrivInfo['DATE_BEG_DOC'];
                 DateBeg.Enabled:=False;
                 DateEnd.Date:=GetPersonPrivInfo['DATE_END_DOC'];
                 DateEnd.Enabled:=False;
                 LgotDSet.Close;
                 LgotDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_SP_LGOT_SEL_BY_ID(:ID_LGOT, :ACT_DATE)';
                 LgotDSet.ParamByName('ID_LGOT').AsString:=GetPersonPrivInfo['ID_PPRIVILEGES'];
                 LgotDSet.ParamByName('ACT_DATE').AsDate:=Date;
                 LgotDSet.Open;
                 LgotBox.EditValue:=GetPersonPrivInfo['ID_PPRIVILEGES'];
                 LgotBox.Enabled:=False;
              end;
           end;
        end;
     1: begin
           lblGroup.Visible:=False;
           GroupBox.Visible:=False;
           lblFirstName.Visible:=False;
           FirstNameBox.Visible:=False;
           lblName.Visible:=False;
           NameBox.Visible:=False;
           lblPatronymic.Visible:=False;
           PatrBox.Visible:=False;
           BoxFIO.Visible:=False;
           lblInn.Visible:=False;
           InnEdit.Visible:=False;
           BoxCustomerService.Top:=78;
           btnOk.Top:=158;
           btnCancel.Top:=158;
           Self.Height:=220;
           if GetPersonPrivInfo.Active then GetPersonPrivInfo.Close;
           GetPersonPrivInfo.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_PERSON_PRIVILEGES_DOC WHERE ID_PERSON_PRIV=:ID_PRIV';
           GetPersonPrivInfo.ParamByName('ID_PRIV').AsInteger:=IdPersonPriv;
           GetPersonPrivInfo.Open;
           if not GetPersonPrivInfo.IsEmpty then
           begin
              if not VarIsNull(GetPersonPrivInfo['NUM_DOC']) then NomerEdit.Text:=GetPersonPrivInfo['NUM_DOC'];
              if not VarIsNull(GetPersonPrivInfo['NAME_ORGANIZATION_DOC']) then CustServiceEdit.Text:=GetPersonPrivInfo['NAME_ORGANIZATION_DOC'];
              DateBeg.Date:=GetPersonPrivInfo['DATE_BEG_DOC'];
              DateEnd.Date:=GetPersonPrivInfo['DATE_END_DOC'];
              if LgotDSet.Active then LgotDSet.Close;
              LgotDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_SP_LGOT_SEL_BY_ID(:ID_LGOT, :ACT_DATE)';
              LgotDSet.ParamByName('ID_LGOT').AsString:=GetPersonPrivInfo['ID_PPRIVILEGES'];
              LgotDSet.ParamByName('ACT_DATE').AsDate:=Date;
              LgotDSet.Open;
              LgotBox.EditValue:=GetPersonPrivInfo['ID_PPRIVILEGES'];
           end;
        end;
     2: begin
           if GetPersonPrivInfo.Active then GetPersonPrivInfo.Close;
           GetPersonPrivInfo.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_PERSON_PRIV_GET_INFO_BY_ID(:ID_PERSON_PRIV, :ACT_DATE)';
           GetPersonPrivInfo.ParamByName('ID_PERSON_PRIV').AsInteger:=IdPersonPriv;
           GetPersonPrivInfo.ParamByName('ACT_DATE').AsDate:=Date;
           GetPersonPrivInfo.Open;
           if not GetPersonPrivInfo.IsEmpty then
           begin
              for i:=0 to Self.ComponentCount-1 do
              begin
                 if Components[i] is TcxTextEdit then (Components[i] as TcxTextEdit).Enabled:=False
                 else if Components[i] is TcxDateEdit then (Components[i] as TcxDateEdit).Enabled:=False
                      else if Components[i] is TcxLookupComboBox then (Components[i] as TcxLookupComboBox).Enabled:=False;
                 if not VarIsNull(GetPersonPrivInfo['TIN_PERSON_PRIV']) then InnEdit.Text:=GetPersonPrivInfo['TIN_PERSON_PRIV'];
                 if not VarIsNull(GetPersonPrivInfo['NUM_DOC']) then NomerEdit.Text:=GetPersonPrivInfo['NUM_DOC'];
                 if not VarIsNull(GetPersonPrivInfo['NAME_ORGANIZATION_DOC']) then CustServiceEdit.Text:=GetPersonPrivInfo['NAME_ORGANIZATION_DOC'];
                 DateBeg.Date:=GetPersonPrivInfo['DATE_BEG_DOC'];
                 DateEnd.Date:=GetPersonPrivInfo['DATE_END_DOC'];
                 LgotDSet.Close;
                 LgotDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_SP_LGOT_SEL_BY_ID(:ID_LGOT, :ACT_DATE)';
                 LgotDSet.ParamByName('ID_LGOT').AsString:=GetPersonPrivInfo['ID_PPRIVILEGES'];
                 LgotDSet.ParamByName('ACT_DATE').AsDate:=Date;
                 LgotDSet.Open;
                 LgotBox.EditValue:=GetPersonPrivInfo['ID_PPRIVILEGES'];
                 if GroupDSet.Active then GroupDSet.Close;
                 GroupDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_SP_PERSON_PRIV_TYPE';
                 GroupDSet.Open;
                 GroupBox.EditValue:=GetPersonPrivInfo['ID_PERSON_PRIV_TYPE'];
                 if FirstNameDSet.Active then FirstNameDSet.Close;
                 FirstNameDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_GET_FIO_LGOT_BY_ID(:ID_PERSON_PRIV_KEY, :RADIO_BTN)';
                 FirstNameDSet.ParamByName('ID_PERSON_PRIV_KEY').AsInteger:=GetPersonPrivInfo['ID_PERSON_PRIV_KEY'];
                 FirstNameDSet.ParamByName('RADIO_BTN').AsShort:=0;
                 FirstNameDSet.Open;
                 FirstNameBox.EditValue:=1;
                 if NameDSet.Active then NameDSet.Close;
                 NameDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_GET_FIO_LGOT_BY_ID(:ID_PERSON_PRIV_KEY, :RADIO_BTN)';
                 NameDSet.ParamByName('ID_PERSON_PRIV_KEY').AsInteger:=GetPersonPrivInfo['ID_PERSON_PRIV_KEY'];
                 NameDSet.ParamByName('RADIO_BTN').AsShort:=1;
                 NameDSet.Open;
                 NameBox.EditValue:=1;
                 if PatrDSet.Active then PatrDSet.Close;
                 PatrDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_GET_FIO_LGOT_BY_ID(:ID_PERSON_PRIV_KEY, :RADIO_BTN)';
                 PatrDSet.ParamByName('ID_PERSON_PRIV_KEY').AsInteger:=GetPersonPrivInfo['ID_PERSON_PRIV_KEY'];
                 PatrDSet.ParamByName('RADIO_BTN').AsShort:=2;
                 PatrDSet.Open;
                 PatrBox.EditValue:=1;
              end;
           end;
        end;
   end;
end;

procedure TfrmLgotEdit.TimerEditTimer(Sender: TObject);
begin
   TimerEdit.Enabled:=False;
   case ContextInputType of
      0:
      begin
         FirstNameDSet.Close;
         FirstNameDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_FIO_LGOT_FILTER(:FILTER_STR, :RADIO_BTN)';
         FirstNameDSet.ParamByName('FILTER_STR').AsString:=FirstNameBox.EditText;
         FirstNameDSet.ParamByName('RADIO_BTN').AsShort:=0;
         FirstNameDSet.Open;
         if not FirstNameDSet.IsEmpty then
         begin
            FirstNameBox.DroppedDown:=True;
         end;
      end;
      1:
      begin
         NameDSet.Close;
         NameDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_FIO_LGOT_FILTER(:FILTER_STR, :RADIO_BTN)';
         NameDSet.ParamByName('FILTER_STR').AsString:=NameBox.EditText;
         NameDSet.ParamByName('RADIO_BTN').AsShort:=1;
         NameDSet.Open;
         if not NameDSet.IsEmpty then
         begin
            NameBox.DroppedDown:=True;
         end;
      end;
      2:
      begin
         PatrDSet.Close;
         PatrDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_FIO_LGOT_FILTER(:FILTER_STR, :RADIO_BTN)';
         PatrDSet.ParamByName('FILTER_STR').AsString:=PatrBox.EditText;
         PatrDSet.ParamByName('RADIO_BTN').AsShort:=2;
         PatrDSet.Open;
         if not PatrDSet.IsEmpty then
         begin
            PatrBox.DroppedDown:=True;
         end;
      end;
      3:
      begin
         LgotDSet.Close;
         LgotDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_SP_LGOT_FILTER(:FILTER_STR, :ACT_DATE)';
         LgotDSet.ParamByName('FILTER_STR').AsString:=LgotBox.EditText;
         LgotDSet.ParamByName('ACT_DATE').AsDate:=Date;
         LgotDSet.Open;
         if not LgotDSet.IsEmpty then
         begin
            LgotBox.DroppedDown:=True;
         end;
      end;
      4:
      begin
         CustServDset.Close;
         CustServDset.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_NAME_CUSTOM_SERVICE_FILTER(:FILTER_STR)';
         CustServDset.ParamByName('FILTER_STR').AsString:=CustomerServiceBox.EditText;
         CustServDset.Open;
         if not CustServDset.IsEmpty then
         begin
            CustomerServiceBox.DroppedDown:=True;
         end;
      end;
   end;
end;

function TfrmLgotEdit.CheckData:Boolean;
begin
   Result:=True;
   if (VarIsNull(GroupBox.EditValue) And (LgotEditMode=0)) then
   begin
      GroupBox.Style.Color:=$00DDBBFF;
      GroupBox.SetFocus;
      Result:=False;
      bsShowMessage('Увага!', 'Ви не обрали групу!', mtInformation, [mbOK]);
   end;

   if ((VarIsNull(LgotBox.EditValue)) And (GroupBox.EditValue<>1)) then
   begin
      LgotBox.Style.Color:=$00DDBBFF;
      LgotBox.SetFocus;
      Result:=False;
      bsShowMessage('Увага!', 'Ви не не обрали пільгу!', mtInformation, [mbOK]);
   end;

   if ((FirstNameBox.EditText='') And (LgotEditMode=0)) then
   begin
      FirstNameBox.Style.Color:=$00DDBBFF;
      FirstNameBox.SetFocus;
      Result:=False;
      bsShowMessage('Увага!', 'Ви не заповнили поле "Прізвище"!', mtInformation, [mbOK]);
   end;

   if ((NameBox.EditText='') And (LgotEditMode=0)) then
   begin
      NameBox.Style.Color:=$00DDBBFF;
      NameBox.SetFocus;
      Result:=False;
      bsShowMessage('Увага!', 'Ви не заповнили поле "І''мя"!', mtInformation, [mbOK]);
   end;

   if ((PatrBox.EditText='') And (LgotEditMode=0)) then
   begin
      PatrBox.Style.Color:=$00DDBBFF;
      PatrBox.SetFocus;
      Result:=False;
      bsShowMessage('Увага!', 'Ви не заповнили поле "По батькові"!', mtInformation, [mbOK]);
   end;

   if DateBeg.Text='' then
   begin
      DateBeg.Style.Color:=$00DDBBFF;
      DateBeg.SetFocus;
      Result:=False;
      bsShowMessage('Увага!', 'Ви не обрали дату початку!', mtInformation, [mbOK]);
   end;

   if DateEnd.Text='' then
   begin
      DateEnd.Style.Color:=$00DDBBFF;
      DateEnd.SetFocus;
      Result:=False;
      bsShowMessage('Увага!', 'Ви не обрали дату кінця!', mtInformation, [mbOK]);
   end;

   if DateBeg.Date<MDateBeg then
   begin
      Result:=False;
      bsShowMessage('Увага!', 'Дата початку дії пільги не може бути менш, ніж дата початку особового рахунку ('+DateToStr(MDateBeg)+')!', mtInformation, [mbOK]);
   end;

   if DateEnd.Date>MDateEnd then
   begin
      Result:=False;
      bsShowMessage('Увага!', 'Дата кінця дії пільги не може бути більш, ніж дата кінця особового рахунку ('+DateToStr(MDateEnd)+')!', mtInformation, [mbOK]);
   end;

   if DateBeg.Date>DateEnd.Date then
   begin
      Result:=False;
      bsShowMessage('Увага!', 'Дата початку дії пільги не може перевищувати дату кінця дії!', mtInformation, [mbOK]);
   end;
end;

procedure TfrmLgotEdit.LgotBoxEnter(Sender: TObject);
begin
   TimerEdit.Interval:=2000;
   TimerEdit.Enabled:=False;
end;

procedure TfrmLgotEdit.LgotBoxExit(Sender: TObject);
begin
   TimerEdit.Enabled:=False;
end;

procedure TfrmLgotEdit.LgotBoxClick(Sender: TObject);
begin
   TimerEdit.Interval:=2000;
   TimerEdit.Enabled:=False;
end;

procedure TfrmLgotEdit.FirstNameBoxClick(Sender: TObject);
begin
   TimerEdit.Interval:=500;
   TimerEdit.Enabled:=False;
end;

procedure TfrmLgotEdit.FirstNameBoxEnter(Sender: TObject);
begin
   TimerEdit.Interval:=500;
   TimerEdit.Enabled:=False;
end;

procedure TfrmLgotEdit.FirstNameBoxExit(Sender: TObject);
begin
   TimerEdit.Enabled:=False;
end;

procedure TfrmLgotEdit.NameBoxClick(Sender: TObject);
begin
   TimerEdit.Interval:=500;
   TimerEdit.Enabled:=False;
end;

procedure TfrmLgotEdit.NameBoxEnter(Sender: TObject);
begin
   TimerEdit.Interval:=500;
   TimerEdit.Enabled:=False;
end;

procedure TfrmLgotEdit.NameBoxExit(Sender: TObject);
begin
   TimerEdit.Enabled:=False;
end;

procedure TfrmLgotEdit.PatrBoxClick(Sender: TObject);
begin
   TimerEdit.Interval:=500;
   TimerEdit.Enabled:=False;
end;

procedure TfrmLgotEdit.PatrBoxEnter(Sender: TObject);
begin
   TimerEdit.Interval:=500;
   TimerEdit.Enabled:=False;
end;

procedure TfrmLgotEdit.PatrBoxExit(Sender: TObject);
begin
   TimerEdit.Enabled:=False;
end;

procedure TfrmLgotEdit.CustomerServiceBoxExit(Sender: TObject);
begin
   TimerEdit.Enabled:=False;
end;

procedure TfrmLgotEdit.CustomerServiceBoxEnter(Sender: TObject);
begin
   TimerEdit.Interval:=2000;
   TimerEdit.Enabled:=False;
end;

procedure TfrmLgotEdit.CustomerServiceBoxClick(Sender: TObject);
begin
   TimerEdit.Interval:=2000;
   TimerEdit.Enabled:=False;
end;

procedure TfrmLgotEdit.LgotBoxKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   ContextInputType:=3;
   if LgotBox.EditText='' then
      if LgotDSet.Active then LgotDSet.Close;
   TimerEdit.Enabled:=not ((LgotBox.EditText='') or (Key=VK_RETURN));   
end;

procedure TfrmLgotEdit.FirstNameBoxKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   ContextInputType:=0;
   if FirstNameBox.EditText='' then
      if FirstNameDSet.Active then FirstNameDSet.Close;
   TimerEdit.Enabled:=not ((FirstNameBox.EditText='') or (Key=VK_RETURN));
end;

procedure TfrmLgotEdit.NameBoxKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   ContextInputType:=1;
   if NameBox.EditText='' then
      if NameDSet.Active then NameDSet.Close;
   TimerEdit.Enabled:=not ((NameBox.EditText='') or (Key=VK_RETURN));
end;

procedure TfrmLgotEdit.PatrBoxKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   ContextInputType:=2;
   if PatrBox.EditText='' then
      if PatrDSet.Active then PatrDSet.Close;
   TimerEdit.Enabled:= not ((PatrBox.EditText='') or (Key=VK_RETURN));   
end;

procedure TfrmLgotEdit.CustomerServiceBoxKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   ContextInputType:=4;
   if CustomerServiceBox.EditText='' then
      if CustServDset.Active then CustServDset.Close;
   TimerEdit.Enabled:= not (CustomerServiceBox.EditText='');   
end;

procedure TfrmLgotEdit.btnOkClick(Sender: TObject);
begin
   if CheckData then ModalResult:=mrOk;
end;

procedure TfrmLgotEdit.btnCancelClick(Sender: TObject);
begin
   ModalResult:=mrCancel;
end;

procedure TfrmLgotEdit.LgotBoxPropertiesInitPopup(Sender: TObject);
begin
   if LgotBox.EditText='' then
   begin
      LgotDSet.Close;
      LgotDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_SP_LGOT_FILTER(:FILTER_STR, :ACT_DATE)';
      LgotDSet.ParamByName('FILTER_STR').AsString:=LgotBox.EditText;
      LgotDSet.ParamByName('ACT_DATE').AsDate:=Date;
      LgotDSet.Open;
   end;
end;

procedure TfrmLgotEdit.FirstNameBoxPropertiesInitPopup(Sender: TObject);
begin
   if FirstNameBox.EditText='' then
   begin
      FirstNameDSet.Close;
      FirstNameDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_FIO_LGOT_FILTER(:FILTER_STR, :RADIO_BTN)';
      FirstNameDSet.ParamByName('FILTER_STR').AsString:=FirstNameBox.EditText;
      FirstNameDSet.ParamByName('RADIO_BTN').AsShort:=0;
      FirstNameDSet.Open;
   end;
end;

procedure TfrmLgotEdit.NameBoxPropertiesInitPopup(Sender: TObject);
begin
   if NameBox.EditText='' then
   begin
      NameDSet.Close;
      NameDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_FIO_LGOT_FILTER(:FILTER_STR, :RADIO_BTN)';
      NameDSet.ParamByName('FILTER_STR').AsString:=NameBox.EditText;
      NameDSet.ParamByName('RADIO_BTN').AsShort:=1;
      NameDSet.Open;
   end;
end;

procedure TfrmLgotEdit.PatrBoxPropertiesInitPopup(Sender: TObject);
begin
   if PatrBox.EditText='' then
   begin
      PatrDSet.Close;
      PatrDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_FIO_LGOT_FILTER(:FILTER_STR, :RADIO_BTN)';
      PatrDSet.ParamByName('FILTER_STR').AsString:=PatrBox.EditText;
      PatrDSet.ParamByName('RADIO_BTN').AsShort:=2;
      PatrDSet.Open;
   end;
end;

procedure TfrmLgotEdit.CustomerServiceBoxPropertiesInitPopup(
  Sender: TObject);
begin
   if CustomerServiceBox.EditText='' then
   begin
      CustServDset.Close;
      CustServDset.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_NAME_CUSTOM_SERVICE_FILTER(:FILTER_STR)';
      CustServDset.ParamByName('FILTER_STR').AsString:=CustomerServiceBox.EditText;
      CustServDset.Open;
   end;
end;

procedure TfrmLgotEdit.LgotBoxPropertiesChange(Sender: TObject);
begin
   lblProc.Caption:='% '+FloatToStr(LgotBox.Properties.ListColumns.Items[1].Field.AsFloat);
end;

end.
