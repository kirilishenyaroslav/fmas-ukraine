unit PaymentCountUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxSpinEdit, StdCtrls, cxDropDownEdit, cxEditRepositoryItems, cxCalendar,
  cxMRUEdit, cxProgressBar, cxLookAndFeelPainters, cxButtons, FIBDatabase,
  pFIBDatabase, DB, FIBDataSet, pFIBDataSet, FIBQuery, pFIBQuery,
  pFIBStoredProc,IBase, cxLabel, cxDBLabel,cxButtonEdit,Unit_PaymentCountConsts,
  ZMessages,PackageLoad, ComCtrls, pFIBErrorHandler, FIB,dmPaymentCount,
  uNotPassedOrdersList,ZProc,uCountListForm;

  {Если AccountType=1-то это обычный расчет, если AccountType=2 то это срочный расчет }
  function StartPaymentCount(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;
                             AccountType:Integer):Variant;stdcall;
  exports StartPaymentCount;

type
  TPaymentCountForm = class(TForm)
    PageControl: TPageControl;
    ParamInputPage: TTabSheet;
    cxEditRepository1: TcxEditRepository;
    MonthBoxRepository: TcxEditRepositoryComboBoxItem;
    CountProcessPage: TTabSheet;
    CountProgressBar: TcxProgressBar;
    StartBtn: TcxButton;
    PeopleDataSet: TpFIBDataSet;
    NextBtn: TcxButton;
    CancelBtn: TcxButton;
    ConvertQuery: TpFIBDataSet;
    ConvertQueryKOD_SETUP: TFIBIntegerField;
    PeopleDataSource: TDataSource;
    StatusGroupBox: TGroupBox;
    FamiliaCaption: TLabel;
    ManDBLabel: TcxDBLabel;
    TnLabel: TLabel;
    TnDbLabel: TcxDBLabel;
    ManSelectBox: TGroupBox;
    ManEdit: TcxButtonEdit;
    GetCurPeriod: TpFIBQuery;
    GetGroupQuery: TpFIBQuery;
    GetMonthBoundsQuery: TpFIBQuery;
    ClearTmpProc: TpFIBStoredProc;
    UVProc: TpFIBStoredProc;
    AllPeopleBtn: TRadioButton;
    ManSelBtn: TRadioButton;
    PeopleDataSetOUT_FAMILIA: TFIBStringField;
    PeopleDataSetOUT_TN: TFIBIntegerField;
    PeopleDataSetID_MAN: TFIBIntegerField;
 {   procedure NextBtnClick(Sender: TObject);
    procedure StartBtnClick(Sender: TObject);
    procedure ManEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AllPeopleBtnClick(Sender: TObject);
    procedure ManSelBtnClick(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);}

  private
    { Private declarations }
  public
 {  constructor Create(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE);reintroduce;}
  end;

var
  PaymentCountForm: TPaymentCountForm;
  Year:     Integer;
  Month:    Integer;
  KodSetup2:Integer;
  DateBeg:  TDate;
  DateEnd:  TDate;
  IdMan  :  Integer;
  KodSetup1:  Integer;

implementation
{$R *.dfm}
function StartPaymentCount(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;
                           AccountType:Integer):Variant;stdcall;
var
{form:TPaymentCountForm;}
form:TCountListForm;
begin
{ form:=TPaymentCountForm.Create(AOwner,DB_HANDLE);}
 form:=TCountListForm.Create(AOwner,DB_HANDLE,AccountType);
 form.Show;
{ form.Free;}
{ StartPaymentCount:=null;}
end;

{procedure TPaymentCountForm.NextBtnClick(Sender: TObject);
var
    S:String;
    form:TNotPassedOrdersForm;
begin
    CountProcessPage.TabVisible:=True;
    PageControl.ActivePage:=CountProcessPage;

    MainDm.ReadTransaction.StartTransaction;
    GetCurPeriod.ExecQuery;
    MainDM.ReadTransaction.Commit;


    MainDm.CheckOrdersDataSet.Open;
    if ( not MainDm.CheckOrdersDataSet.IsEmpty)
    then
        begin
        ZShowMessage('Попередження',
                    'Знайдено непераді накази!',mtInformation,[mbOk]);
        form:=TNotPassedOrdersForm.Create(Self);

        if (form.ShowModal=mrCancel)
        then
            Self.ModalResult:=mrCancel;
        end;



    Year:=GetCurPeriod['Year_Set'].Value;
    Month:=GetCurPeriod['Month_Set'].Value;

    GetMonthBoundsQuery.Params.ParamByName('YEAR').Value:=Year;
    GetMonthBoundsQuery.Params.ParamByName('MONTH').Value:=Month;

    MainDm.ReadTransaction.StartTransaction;
    GetMonthBoundsQuery.ExecQuery;
    MainDM.ReadTransaction.Commit;

    DateBeg:=GetMonthBoundsQuery['MONTH_BEG'].value;
    DateEnd:=GetMonthBoundsQuery['MONTH_END'].value;


    S:=DateToStr(DateBeg);
    ConvertQuery.ParamByName('DATE_IN').Value:=S;
    ConvertQuery.Open;
    KodSetup1:=ConvertQuery['KOD_SETUP'];
    KodSetup2:=KodSetup1;


end;



constructor TPaymentCountForm.Create(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE);
begin
    inherited Create(AOwner);
    MainDm:=TMainDm.Create(Self);
    MainDm.MainDataBase.Connected:=False;
    MainDm.MainDatabase.Handle:=DB_HANDLE;
    MainDm.ReadTransaction.StartTransaction;

    CountProcessPage.TabVisible:=False;
    Self.Caption:=FormCaption;
    Self.ParamInputPage.Caption:=ParamTabCaption;
    Self.CountProcessPage.Caption:=ProcesssTabCaption;
    Self.ManSelectBox.Caption:=ManBoxCaption;
    Self.NextBtn.Caption:=NextButtonCaption;
    Self.CancelBtn.Caption:=CancelButtonCaption;
    Self.StatusGroupBox.Caption:=StatusBoxCaption;
    Self.FamiliaCaption.Caption:=FamiliaLabelCaption;
    Self.TnLabel.Caption:=TnCaption;
    Self.StartBtn.Caption:=StartButtonCaption;
    Self.AllPeopleBtn.Caption:=AllPeopleBtnCaption;

    IdMan:=-1;

end;


procedure TPaymentCountForm.StartBtnClick(Sender: TObject);
Var
    ManTotal:   Integer;
    IdGroupAccount: Integer;

begin
    ZProc.SetBeginAction(MainDm.MainDatabase.Handle,1);

    ClearTmpProc.StoredProcName:='Z_CLEAR_TMP_ACCOUNT';
    GetGroupQuery.ExecQuery;
    IdGroupAccount:=GetGroupQuery['ID_GROUP_ACCOUNT'].value;

    if (IdMan<>-1)then
            MainDm.FillSpisokForCountQuery.ParamByName('IN_ID_MAN').value:=IdMan;

    MainDm.FillSpisokForCountQuery.ParamByName('DATE_BEG').Value:=DateToStr(DateBeg);
    MainDm.FillSpisokForCountQuery.ParamByName('DATE_END').Value:=DateToStr(DateEnd);
    MainDm.FillSpisokForCountQuery.ParamByName('KOD_SETUP2').Value:=KodSetup2;


    MainDm.WriteTransaction.StartTransaction;

    try
       MainDM.FillSpisokForCountQuery.ExecQuery;
       MainDm.WriteTransaction.Commit;
    except on E:Exception
    do
      begin
        ShowMessage(E.Message);
        MainDM.WriteTransaction.Rollback;

      end;
    end;



    PeopleDataSet.Open;
    PeopleDataSet.FetchAll;
    ManTotal:=PeopleDataSet.RecordCount;

    CountProgressBar.Properties.Max:=ManTotal;

    PeopleDataSet.First;
    TnDbLabel.Visible:=True;
    ManDbLabel.Visible:=True;


        while (not PeopleDataSet.Eof)
        do
            begin
                    MainDm.WriteTransaction.StartTransaction;

                    //ClearTmpProc.ExecProc;
                    CountProc.ParamByName('DATE_BEG').Value:=DateToStr(DateBeg);
                    CountProc.ParamByName('DATE_END').Value:=DateToStr(DateEnd);
                    CountProc.ParamByName('ID_MAN').Value:=
                                            PeopleDataSet['ID_MAN'];
                    CountProc.ParamByName('ID_GROUP_ACCOUNT').Value:=IdGroupAccount;
                    CountProc.ParamByName('NIGHT_PERCENT').Value:=40;
                    CountProc.ParamByName('KOD_SETUP_1').Value:=KodSetup1;
                    CountProc.ParamByName('KOD_SETUP_2').Value:=KodSetup2;
                    CountProc.ParamByName('DO_INDEX').Value:='T';

                  try
                    CountProc.ExecProc;
                    MainDM.WriteTransaction.Commit;
                  except on E:Exception
                  do
                        begin
                           

                            ZShowMessage('Помилка!',E.Message,mtError,[mbOk]);
                            MainDM.WriteTransaction.Rollback;
                        end;
                  end;

                    PeopleDataSet.Next;

                    Application.ProcessMessages;

                    CountProgressBar.Position:=CountProgressBar.Position+1;
            end;


    ShowMessage('Розрахунок закінчено!');
    ZProc.SetEndAction(MainDm.MainDatabase.Handle,'T');
    if ZShowMessage('Фором. відомостей','Сформувати відомості?',mtConfirmation,
            [mbOk,mbCancel])=mrOk
                then
                    begin

                     UVProc.SQL.Text:=
                                'EXECUTE PROCEDURE Z_ACCOUNT_TO_TMPSHPRO 1';

                        MainDM.WriteTransaction.StartTransaction;
                    try
                            UVProc.ExecProc;
                        except on E:Exception
                        do
                         begin
                                ZShowMessage('Помилка!',
                                    E.Message,mtInformation,[mbOk]);
                                MainDM.WriteTransaction.Rollback;
                                Exit;
                            end;
                      end;

                    MainDM.WriteTransaction.Commit;

                    UVProc.SQL.Text:='EXECUTE PROCEDURE UV_FORMSHEET 0,1';

                    MainDM.WriteTransaction.StartTransaction;
                 try
                        UVProc.ExecProc;
                    except on E:Exception
                    do
                        begin
                            ZShowMessage('Помилка!',
                                E.Message,mtInformation,[mbOk]);
                            MainDM.WriteTransaction.Rollback;
                            Exit;
                        end;
                    end;
MainDM.WriteTransaction.Commit;
ZShowMessage('Сформовано!','Відомотсті вдало сформовано!',mtInformation,
                [mbOk]);
end;


end;

procedure TPaymentCountForm.ManEditPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
PeopleArray:Variant;
begin
// PeopleArray:=AllPeopleUnit.GetMan(Self,MainDm.MainDataBAse.Handle);

 PeopleArray:=LoadPeopleModal(self,MainDM.MainDataBase.Handle);
 ManEdit.Text:=PeopleArray[1]+' ' +PeopleArray[2]+' '+PeopleArray[3];
 IdMan:=PeopleArray[0];
 PeopleDataSet.Filter:='ID_MAN='+IntToStr(IdMan);


end;

procedure TPaymentCountForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    if (MainDm.ReadTransaction.InTransaction) then
            MainDM.ReadTransaction.Commit;
    if (MainDM.WriteTransaction.InTransaction) then
            MainDM.WriteTransaction.Commit;

//    if MainDatabase.Connected then MainDatabase.False;
 //      ReadTransaction.Active:=False;
 //      ReadTransaction.Free;
 //      WriteTransaction.Free;

end;

procedure TPaymentCountForm.AllPeopleBtnClick(Sender: TObject);
begin
    IdMan:=-1;
    ManEdit.Enabled:=False;
end;

procedure TPaymentCountForm.ManSelBtnClick(Sender: TObject);
begin
    ManEdit.Enabled:=True;
end;

procedure TPaymentCountForm.CancelBtnClick(Sender: TObject);
begin
ModalResult:=mrCancel;
end;}


end.
