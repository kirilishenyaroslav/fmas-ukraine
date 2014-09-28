{***************************************************************
* Unit BankNastroyka.					       *
*							       *
* Описание предназначения(работы) модуля: настройка банка      *
* Copyright ©  Год 2006, Автор: Ворновских Макс                *
***************************************************************}

unit BankNastroyka;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxMemo,
  cxButtonEdit, cxDropDownEdit, cxCalendar, FIBDatabase, pFIBDatabase,
  cxLookAndFeelPainters, StdCtrls, cxButtons, cxCheckBox, ExtCtrls, DB,
  FIBDataSet, pFIBDataSet, FIBQuery, pFIBQuery, pFIBStoredProc, Placemnt, IBase, GlobalSPR;

type

  TfmBankNastroyka = class(TForm)
    cxMaskDayShowLast: TcxMaskEdit;
    cxMemoDayShowLast: TcxMemo;
    cxButtonEditGroup: TcxButtonEdit;
    cxMemoGroup: TcxMemo;
    cxButtonEditGroupAddPR: TcxButtonEdit;
    cxMemoGroupAddPR: TcxMemo;
    cxButtonEditGroupAddRas: TcxButtonEdit;
    cxMemoGroupAddRas: TcxMemo;
    cxDateEditDateInstallSystem: TcxDateEdit;
    cxMemoDateInstallSystem: TcxMemo;
    pFIBDatabase1: TpFIBDatabase;
    pFIBTransactionBase: TpFIBTransaction;
    cxButtonCancel: TcxButton;
    cxButtonWrite: TcxButton;
    cxMemoIDDogKomis: TcxMemo;
    cxButtonEditIDDogKomis: TcxButtonEdit;
    cxMemoKODDogKomis: TcxMemo;
    cxButtonEditKODDogKomis: TcxButtonEdit;
    cxMemoState: TcxMemo;
    cxButtonEditState: TcxButtonEdit;
    cxCheckBoxKomis: TcxCheckBox;
    cxMemoKomis: TcxMemo;
    cxButtonKomis: TcxButtonEdit;
    Panel1: TPanel;
    pFIBDataSet: TpFIBDataSet;
    pFIBTransactionDataSet: TpFIBTransaction;
    pFIBDataSetState: TpFIBDataSet;
    pFIBTransactionState: TpFIBTransaction;
    pFIBQueryWrite: TpFIBQuery;
    pFIBTransactionWrite: TpFIBTransaction;
    pFIBDataSet_Get_Group: TpFIBDataSet;
    pFIBTransaction_Get_Group: TpFIBTransaction;
    pFIBDataSet_Get_GroupID_GROUP_DOC: TFIBBCDField;
    pFIBDataSet_Get_GroupN_GROUP_DOC: TFIBIntegerField;
    pFIBDataSet_Get_GroupNAME_GROUP_DOC: TFIBStringField;
    DataSet: TpFIBDataSet;
    Transaction: TpFIBTransaction;
    cxButtonEditID_KEKV: TcxButtonEdit;
    cxMemoID_KEKV: TcxMemo;
    pFIBStoredProc1: TpFIBStoredProc;
    pFIBTransaction_start: TpFIBTransaction;
    MaskDay_AgoShow: TcxMaskEdit;
    MaskDay_AgoDo: TcxMaskEdit;
    MemoDay_AgoShow: TcxMemo;
    MemoDay_AgoDo: TcxMemo;
    FormStorage1: TFormStorage;
    CheckBoxExpertSystem: TcxCheckBox;
    MemoExpertSystem: TcxMemo;
    MemoMoveDBKr: TcxMemo;
    cxComboBox1: TcxComboBox;
    cxButtonRazd: TcxButtonEdit;
    cxMemoRazd: TcxMemo;
    cxButtonDog: TcxButtonEdit;
    cxMemoDog: TcxMemo;
    Transaction1: TpFIBTransaction;
    cxMemoNich: TcxMemo;
    cxCheckBoxNich: TcxCheckBox;
    cxDateValutaEdit: TcxDateEdit;
    cxDateValutaMemo: TcxMemo; //override;
    procedure cxButtonCancelClick(Sender: TObject);
    procedure cxCheckBoxKomisPropertiesChange(Sender: TObject);
    procedure cxButtonEditStatePropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonEditGroupPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonEditGroupAddPRPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonEditGroupAddRasPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonKomisPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonWriteClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxButtonEditIDDogKomisPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonEditKODDogKomisPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure AfterConstruction; override;
    procedure cxButtonEditID_KEKVPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure FormCreate(Sender: TObject);
    procedure cxButtonDogPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonRazdPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    id_user : int64;
  public
    constructor Create(AOwner: TComponent; d : Tpfibdatabase); reintroduce;
  end;

function Show_Bank_nastroyka(AO : tcomponent; D : Tpfibdatabase; id_use : int64) : integer; stdcall;
    exports Show_Bank_nastroyka;

implementation
uses Un_R_file_Alex, LoadDogManedger, DogLoaderUnit, Accmgmt;

var
{Переменные для записи в таблицу BANK_INI}
        id_state:               int64;          //BANK_ID_STATE_KOMIS
        id_group:               int64;          //ID_GROUP
        id_group_add_pr:        int64;          //ID_GROUP_ADD_PR
        id_group_add_ras:       int64;          //ID_GROUP_ADD_RAS

        id_sch:                 int64;          //BANK_SCH_KOMIS
        id_dog_komis:           int64;          //BANK_ID_DOG_KOMIS
        kod_dog_komis:          int64;          //BANK_KOD_DOG_KOMIS
        id_kod_rs_rs_debet:     int64;          //ID_DOG_RS_RS_DEBET
        kod_dog_rs_rs_debet:    int64;          //KOD_DOG_RS_RS_DEBET
        id_kekv:                int64;          //ID_KEKV_FOR_OLD_TRIT
        id_razd:                Integer;        //BANK_ID_RAZDEL_NICH
        id_dog:                 int64;          //BANK_ID_DOG_NICH
        kod_dog:                int64;          //BANK_KOD_DOG_NICH
        check_show_nich:        int64;          //CHECK_SHOW_NICH
        allOnlyRazd:            TRazdStViewMode;
{$R *.dfm}

function Show_Bank_nastroyka(AO : tcomponent; D : Tpfibdatabase; id_use : int64) : integer; stdcall;
var
    T : TfmBankNastroyka;
begin
    T := TfmBankNastroyka.Create(Ao, d);
    T.id_user := id_use;
    T.Show;
end;

procedure TfmBankNastroyka.AfterConstruction;
begin
        inherited AfterConstruction;
        {Вызов процедуры BANK_NASTROYKA_MAX_START}
        pFIBTransaction_start.DefaultDatabase   := pFIBDatabase1;
        pFIBStoredProc1.Database                := pFIBDatabase1;
        pFIBStoredProc1.Transaction             := pFIBTransaction_start;
        pFIBTransaction_start.StartTransaction;
        try
                pFIBStoredProc1.StoredProcName  := 'BANK_NASTROYKA_MAX_START';
                pFIBStoredProc1.ExecProc;
                pFIBTransaction_start.Commit;
        except
                pFIBTransaction_start.Rollback;
        end;
end;

constructor TfmBankNastroyka.Create(AOwner: TComponent; d: Tpfibdatabase);
begin
        inherited Create(AOwner);
{Заголовки...}
        Caption                                := Un_R_file_Alex.BANK_NASTROYKA_FM_CAPTION;
        cxMemoDayShowLast.Text                 := Un_R_file_Alex.BANK_NASTROYKA_DAY_SHOW_LAST;
        cxMemoDateInstallSystem.Text           := Un_R_file_Alex.BANK_NASTROYKA_DATE_INSTALL_SYSTEM;
        cxMemoIDDogKomis.Text                  := Un_R_file_Alex.BANK_NASTROYKA_ID_DOC_KOMIS;
        cxMemoKODDogKomis.Text                 := Un_R_file_Alex.BANK_NASTROYKA_KOD_DOC_KOMIS;
        cxMemoState.Text                       := Un_R_file_Alex.BANK_NASTROYKA_STATE;
        cxMemoKomis.Text                       := Un_R_file_Alex.BANK_NASTROYKA_KOMIS;
        cxMemoGroup.Text                       := Un_R_file_Alex.BANK_NASTROYKA_GROUP;
        cxMemoGroupAddPR.Text                  := Un_R_file_Alex.BANK_NASTROYKA_GROUP_ADD_PR;
        cxMemoGroupAddRas.Text                 := Un_R_file_Alex.BANK_NASTROYKA_GROUP_ADD_RAS;
        cxMemoID_KEKV.Text                     := Un_R_file_Alex.BANK_NASTROYKA_KEKV_CAPTION;
        MemoDay_AgoShow.Text                   := Un_R_file_Alex.BANK_NASTROYKA_DAY_AGO_SHOW;
        MemoDay_AgoDo.Text                     := Un_R_file_Alex.BANK_NASTROYKA_DAY_AGO_DO;
        MemoExpertSystem.Text                  := Un_R_file_Alex.BANK_USE_EXPERT_SYS;
        MemoMoveDBKr.Text                      := Un_R_file_Alex.BANK_ORDER_SCH;
        cxButtonCancel.Caption                 := Un_R_file_Alex.CLOSE_CONST[1];
        cxMemoNich.Text                        := Un_R_file_Alex.BANK_NASTROYKA_NICH;
        cxMemoRazd.Text                        := Un_R_file_Alex.BANK_NASTROYKA_RAZDEL_NICH;
        cxMemoDog.Text                         := Un_R_file_Alex.BANK_NASTROYKA_DOG_NICH;
        cxDateValutaMemo.Text                  := 'Дата початку ведення валютних балансових рахунків';
{FIBs...}
        pFIBDataBase1 := D;
        pFIBTransactionBase.DefaultDatabase             := pFIBDatabase1;
        pFIBDatabase1.DefaultTransaction                := pFIBTransactionBase;
        pFIBDataSet.Database                            := pFIBDatabase1;
        DataSet.Database                                := pFIBDatabase1;
        DataSet.Transaction                             := pFIBTransactionBase;

        pFIBTransactionDataSet.DefaultDatabase          := pFIBDatabase1;
        pFIBDataSet.Transaction                         := pFIBTransactionDataSet;

        pFIBTransactionState.DefaultDatabase            := pFIBDatabase1;
        pFIBDataSetState.Database                       := pFIBDatabase1;
        pFIBDataSetState.Transaction                    := pFIBTransactionState;

        pFIBQueryWrite.Database                         := pFIBDatabase1;
        pFIBQueryWrite.Transaction                      := pFIBTransactionWrite;
        pFIBTransactionWrite.DefaultDatabase            := pFIBDatabase1;

        pFIBDataSet_Get_Group.Database                  := pFIBDatabase1;
        pFIBDataSet_Get_Group.Transaction               := pFIBTransaction_Get_Group;
        pFIBTransaction_Get_Group.DefaultDatabase       := pFIBDatabase1;

        pFIBTransactionBase.StartTransaction;





{Внешний вид...}
        cxButtonKomis.Visible := cxCheckBoxKomis.Checked;
        if (cxCheckBoxKomis.Checked) then
        begin
                cxMemoKomis.Width := 223;
                cxMemoKomis.Left  := 410;
        end
        else
        begin
                cxMemoKomis.Width := 400;
                cxMemoKomis.Left  := 231;
        end;
        Tag := 0;
{Инициализация "-1"-ми возвращаемых идентификаторов}
        id_state                := -1;
        id_group                := -1;
        id_group_add_pr         := -1;
        id_group_add_ras        := -1;
        id_sch                  := -1;
        id_dog_komis            := -1;
        kod_dog_komis           := -1;
        id_kekv                 := -1;
        id_razd                 := -1;
        id_dog                  := -1;
        kod_dog                 := -1;
        check_show_nich         := -1;
{~~~~~~~~~~~~~~~~~~~~~~~~~~~~~Загрузка данных из БД~~~~~~~~~~~~~~~~~~~~~~~~~~~~}
        pFIBDataSet.Close;
        pFIBDataSet.Sqls.SelectSql.Text := 'SELECT * FROM BANK_INI';
        pFIBDataSet.Open;

        if (pFIBDataSet.RecordCount>0)then
        begin //RecordCount>0
                if(not pFIBDataSet.FieldByName('BANK_DAY_SHOW_LAST').IsNull)then
                        cxMaskDayShowLast.Text:=pFIBDataSet.FieldByName('BANK_DAY_SHOW_LAST').AsString;  
                if(not pFIBDataSet.FieldByName('DATE_BEG_VNEDRENIE_VALUTA').IsNull)then
                        cxDateValutaEdit.Date:=pFIBDataSet.FieldByName('DATE_BEG_VNEDRENIE_VALUTA').AsDateTime;
                if(not pFIBDataSet.FieldByName('DAY_AGO_SHOW').IsNull)then
                        MaskDay_AgoShow.Text:=pFIBDataSet.FieldByName('DAY_AGO_SHOW').AsString;
                if(not pFIBDataSet.FieldByName('DAY_AGO_DO').IsNull)then
                        MaskDay_AgoDo.Text:=pFIBDataSet.FieldByName('DAY_AGO_DO').AsString;

                if(not pFIBDataSet.FieldByName('BANK_INSTALL_SYSTEM').IsNull)then
                        cxDateEditDateInstallSystem.EditValue:=pFIBDataSet.FieldByName('BANK_INSTALL_SYSTEM').AsVariant;
                {забираем из базы идентификатор статьи, а записываем возвращаемую по нему статью}
                if(not pFIBDataSet.FieldByName('BANK_ID_STATE_KOMIS').IsNull)then
                begin
                        id_state := StrToInt64(pFIBDataSet.FieldByName('BANK_ID_STATE_KOMIS').AsString);
                        pFIBDataSetState.Close;
                        pFIBDataSetState.SQLs.SelectSQL.Text := 'SELECT * FROM pub_get_name_budg_by_id('+IntToStr(id_state)+', '''+DateToStr(Date)+''', '+IntToStr(3)+')';
                        pFIBDataSetState.Open;
                        cxButtonEditState.Text := pFIBDataSetState.FieldByName('KOD_OBJECT').AsString + ' - ' + pFIBDataSetState.FieldByName('TITLE_OBJECT').AsString;
                        pFIBDataSetState.Close;
                end
                else
                begin
                        id_state:=-1;
                end;
{Забираем  'ID_GROUP'}
                if(not pFIBDataSet['ID_GROUP'] = Null) then
                        id_group:=StrToInt64(pFIBDataSet.FieldByName('ID_GROUP').AsString)
                else
                        id_group:=-1;

                if(id_group>0)then
                begin
                        try
                                pFIBDataSet_Get_Group.Database                  := pFIBDatabase1;
                                pFIBDataSet_Get_Group.Transaction               := pFIBTransaction_Get_Group;
                                pFIBTransaction_Get_Group.DefaultDatabase       := pFIBDatabase1;


                                pFIBDataSet_Get_Group.ParamByName('id').AsInt64:=id_group;
                                pFIBDataSet_Get_Group.Open;
                                //выводим короткое имя

                                cxButtonEditGroup.Text:=pFIBDataSet_Get_GroupNAME_GROUP_DOC.AsString;
                                pFIBTransaction_Get_Group.Commit;
                        except
                                pFIBTransaction_Get_Group.Rollback;
                        end;
                end;
{Забираем  'ID_GROUP_ADD_PR'}
                if(not pFIBDataSet['ID_GROUP_ADD_PR'] = Null) then
                        id_group_add_pr:=StrToInt64(pFIBDataSet.FieldByName('ID_GROUP_ADD_PR').AsString)
                else
                        id_group_add_pr:=-1;

                if(id_group_add_pr>0)then
                begin
                        try
                                pFIBDataSet_Get_Group.Database                  := pFIBDatabase1;
                                pFIBDataSet_Get_Group.Transaction               := pFIBTransaction_Get_Group;
                                pFIBTransaction_Get_Group.DefaultDatabase       := pFIBDatabase1;


                                pFIBDataSet_Get_Group.ParamByName('id').AsInt64:=id_group_add_pr;
                                pFIBDataSet_Get_Group.Open;
                                //выводим короткое имя

                                cxButtonEditGroupAddPR.Text:=pFIBDataSet_Get_GroupNAME_GROUP_DOC.AsString;
                                pFIBTransaction_Get_Group.Commit;
                        except
                                pFIBTransaction_Get_Group.Rollback;
                        end;
                end;

{Забираем  'ID_GROUP_ADD_RAS'}
                if(not pFIBDataSet['ID_GROUP_ADD_RAS'] = Null) then
                        id_group_add_ras:=StrToInt64(pFIBDataSet.FieldByName('ID_GROUP_ADD_RAS').AsString)
                else
                        id_group_add_ras:=-1;

                if(id_group_add_ras>0)then
                begin
                        try
                                pFIBDataSet_Get_Group.Database                  := pFIBDatabase1;
                                pFIBDataSet_Get_Group.Transaction               := pFIBTransaction_Get_Group;
                                pFIBTransaction_Get_Group.DefaultDatabase       := pFIBDatabase1;


                                pFIBDataSet_Get_Group.ParamByName('id').AsInt64:=id_group_add_ras;
                                pFIBDataSet_Get_Group.Open;
                                //выводим короткое имя

                                cxButtonEditGroupAddRas.Text:=pFIBDataSet_Get_GroupNAME_GROUP_DOC.AsString;
                                pFIBTransaction_Get_Group.Commit;
                        except
                                pFIBTransaction_Get_Group.Rollback;
                        end;
                end;
{Забираем  'BANK_SCH_KOMIS'}
                if (pFIBDataSet['BANK_FLAG_SCH_KOMIS'] = 1) then
                begin
                        id_sch := pFIBDataSet['BANK_SCH_KOMIS'];
                        cxCheckBoxKomis.Checked := true;
                        DataSet.Close;
                        DataSet.SQLs.SelectSQL.Text := 'select * from PUB_SP_MAIN_SCH_INFO('''+DateToStr(date)+''', '+intToStr(id_sch)+')';
                        DataSet.Open;
                        cxButtonKomis.Text := DataSet.FBN('SCH_NUMBER').AsString + ' - ' + DataSet.FBN('SCH_TITLE').AsString;
                        DataSet.Close;
                end
                else
                begin
                        id_sch := -1;
                        cxCheckBoxKomis.Checked := false;
                end;

 //nastroika expertnoi systemi
                if (pFIBDataSet['USE_EXPERT_SYSTEM'] = 1) then
                begin
                        CheckBoxExpertSystem.Checked := true;
                end
                else
                begin
                        CheckBoxExpertSystem.Checked := false;
                end;

//nastroika poryadka otobrajeniya schtov na forme bankovskogo dokumenta
                if(pFIBDataSet['USE_MOVE_ORDER_DEB_KR']<>null) then
                     cxComboBox1.ItemIndex       := pFIBDataSet['USE_MOVE_ORDER_DEB_KR']
                else
                     cxComboBox1.ItemIndex       := 0;


{выбор данных по договору, який підставляється в дебет...}
                try id_kod_rs_rs_debet := StrToInt64(pFIBDataSet.FBN('ID_DOG_RS_RS_DEBET').AsString) except id_kod_rs_rs_debet := -1; end;
                if id_kod_rs_rs_debet > 0 then
                begin
                    kod_dog_rs_rs_debet := StrToInt64(pFIBDataSet.FBN('KOD_DOG_RS_RS_DEBET').AsString);
                    DataSet.Close;
                    DataSet.SQLs.SelectSQL.Text := 'select * from DOG_DT_DOCUMENT_INFO('+IntTostr(id_kod_rs_rs_debet)+')';
                    DataSet.Open;
                    cxButtonEditKODDogKomis.Text := DataSet.FBN('D_N_DOG').AsString +  Un_R_file_Alex.BANK_NASTROYKA_VID  + DataSet.FBN('D_D_DOG').AsString + ' ' + DataSet.FBN('D_NAME_CUSTOMER_K').AsString + ' (' + DataSet.FBN('D_REG_NOMER').AsString + ')';;
                    DataSet.Close;
                end;
{выбор данных по договору для комиссии}
                try id_dog_komis := StrToInt64(pFIBDataSet.FBN('BANK_ID_DOG_KOMIS').AsString) except id_dog_komis := -1; end;
                if id_dog_komis > 0 then
                begin
                    kod_dog_komis := StrToInt64(pFIBDataSet.FBN('BANK_KOD_DOG_KOMIS').AsString);
                    DataSet.Close;
                    DataSet.SQLs.SelectSQL.Text := 'select * from DOG_DT_DOCUMENT_INFO('+IntTostr(id_dog_komis)+')';
                    DataSet.Open;
                    cxButtonEditIDDogKomis.Text := DataSet.FBN('D_N_DOG').AsString +  Un_R_file_Alex.BANK_NASTROYKA_VID  + DataSet.FBN('D_D_DOG').AsString + ' ' + DataSet.FBN('D_NAME_CUSTOMER_K').AsString + ' (' + DataSet.FBN('D_REG_NOMER').AsString + ')';;
                    DataSet.Close;
                end;
{Забирание КЕКЗА}
                if(not pFIBDataSet.FieldByName('ID_KEKV_FOR_OLD_TRIT').IsNull)then
                begin
                        id_kekv := StrToInt64(pFIBDataSet.FieldByName('ID_KEKV_FOR_OLD_TRIT').AsString);
                        DataSet.Close;
                        DataSet.Sqls.SelectSql.Text := 'Select * from PUB_SPR_KEKV_INFO('+IntToStr(id_kekv)+', '''+DateToStr(date)+''')';
                        DataSet.Open;
                        cxButtonEditID_KEKV.Text := DataSet.FBN('KEKV_KODE').AsString + ' ' + DataSet.FBN('KEKV_TITLE').AsString;
                end;

{Забирание раздела}
                if(not pFIBDataSet.FieldByName('BANK_ID_RAZDEL_NICH').IsNull) then
                begin
                        id_razd := StrToInt64(pFIBDataSet.FieldByName('BANK_ID_RAZDEL_NICH').AsString);
                        DataSet.Close;
                        DataSet.Sqls.SelectSql.Text := 'Select * from PUB_SPR_RAZD_ST_INFO('+IntToStr(id_razd)+')';
                        DataSet.Open;
                        cxButtonRazd.Text := DataSet.FBN('RAZD_ST_NUM').AsString + ' ' + DataSet.FBN('RAZD_ST_TITLE').AsString;
                end;

{выбор данных по договору для НИЧ}
                try id_dog:= StrToInt64(pFIBDataSet.FBN('BANK_ID_DOG_NICH').AsString) except id_dog:= -1; end;
                if id_dog > 0 then
                begin
                    kod_dog:= StrToInt64(pFIBDataSet.FBN('BANK_KOD_DOG_NICH').AsString);
                    DataSet.Close;
                    DataSet.SQLs.SelectSQL.Text := 'select * from DOG_DT_DOCUMENT_INFO('+IntTostr(id_dog)+')';
                    DataSet.Open;
                    cxButtonDog.Text := DataSet.FBN('D_N_DOG').AsString +  Un_R_file_Alex.BANK_NASTROYKA_VID  + DataSet.FBN('D_D_DOG').AsString + ' ' + DataSet.FBN('D_NAME_CUSTOMER_K').AsString + ' (' + DataSet.FBN('D_REG_NOMER').AsString + ')';;
                    DataSet.Close;
                end;
{~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~}
                if (pFIBDataSet.FieldByName('CHECK_SHOW_NICH').AsInteger = 1) then check_show_nich := 1
                  else check_show_nich := 0;
        end; //RecordCount>0
        pFIBTransactionDataSet.Commit;

        if (check_show_nich = 1) then cxCheckBoxNich.Checked := True
        else cxCheckBoxNich.Checked := false;
end;

procedure TfmBankNastroyka.cxButtonCancelClick(Sender: TObject);
begin
        if(pFIBTransactionBase.Active) then
                PFIBTransactionBase.Rollback;
        Tag := 0;
        Close;
end;

procedure TfmBankNastroyka.cxCheckBoxKomisPropertiesChange(
  Sender: TObject);
begin
        cxButtonKomis.Visible := cxCheckBoxKomis.Checked;
        if (cxCheckBoxKomis.Checked) then
        begin
                cxMemoKomis.Width := 223;
                cxMemoKomis.Left  := 410;
                {if (Tag>0) then
                        cxButtonKomisPropertiesButtonClick(Sender,5)
                else
                        Tag := Tag + 1;}

        end
        else
        begin
                cxMemoKomis.Width := 400;
                cxMemoKomis.Left  := 231;
        end;

end;

procedure TfmBankNastroyka.cxButtonEditStatePropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    rr : variant;
begin
    rr := GlobalSPR.GetRazdStSpr(Self, pFIBDatabase1.Handle, fsNormal, date, 0, allEnable, cmSt);
    try
    begin
        id_state := rr;
        if(id_state=0) then
          id_state:=id_state
        else
        begin
                pFIBDataSetState.Close;
                pFIBDataSetState.SQLs.SelectSQL.Text := 'SELECT * FROM pub_get_name_budg_by_id('+IntToStr(id_state)+', '''+DateToStr(Date)+''', '+IntToStr(3)+')';
                pFIBDataSetState.Open;
                cxButtonEditState.Text := pFIBDataSetState.FieldByName('KOD_OBJECT').AsString + ' - ' + pFIBDataSetState.FieldByName('TITLE_OBJECT').AsString;
                pFIBDataSetState.Close;
        end;
    end;
    except
    end;
end;

procedure TfmBankNastroyka.cxButtonEditGroupPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    Group : variant;
    Cnt, i  : integer;
begin
    Group := LoadDogManedger.WorkGroupDoc(self, pFIBDatabase1.Handle, fsNormal, 'tip_dog');
    if VarArrayDimCount(Group) > 0 then
    begin
        Cnt := VarArrayHighBound(Group, 1);
        id_group := group[0][0];
        cxButtonEditGroup.Text := String(group[0][1]);
    end;

end;



procedure TfmBankNastroyka.cxButtonEditGroupAddPRPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    Group : variant;
    Cnt, i  : integer;
begin
    Group := LoadDogManedger.WorkGroupDoc(self, pFIBDatabase1.Handle, fsNormal, 'tip_dog');
    if VarArrayDimCount(Group) > 0 then
    begin
        Cnt := VarArrayHighBound(Group, 1);
        id_group_add_pr := group[0][0];
        cxButtonEditGroupAddPR.Text := String(group[0][1]);
    end;
end;

procedure TfmBankNastroyka.cxButtonEditGroupAddRasPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    Group : variant;
    Cnt, i  : integer;
begin
    Group := LoadDogManedger.WorkGroupDoc(self, pFIBDatabase1.Handle, fsNormal, 'tip_dog');
    if VarArrayDimCount(Group) > 0 then
    begin
        Cnt := VarArrayHighBound(Group, 1);
        id_group_add_ras := group[0][0];
        cxButtonEditGroupAddRas.Text := String(group[0][1]);
    end;
end;

procedure TfmBankNastroyka.cxButtonKomisPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    res : Variant;
begin
    Res := GlobalSPR.GetSch(self, pFIBDatabase1.Handle, fsNormal, Date, 1, 0, 0);
    if VarArrAyDimCount(res) > 0
    then
    begin
        if VarArrayDimCount(Res) > 0 then
        begin
            id_sch     := Res[0][0];  {записать в базу}
            {из базы}
            {
             DS.. :=  'select * from PUB_SP_MAIN_SCH_INFO('''+date+''', '+intToStr(id_sch)+')'
             DS.Open;
             cxButtonKomis.Text := DS.FBN('SCH_NUMBER').AsString + ' - ' + DS.FBN('SCH_TITLE').AsString;
             DS.Close;
            }

            cxButtonKomis.Text := Res[0][3] + ' - ' + Res[0][1];
        end;
    end else
    begin
        cxButtonKomis.Visible := cxCheckBoxKomis.Checked;
        if (cxCheckBoxKomis.Checked) then
        begin
                cxMemoKomis.Width := 223;
                cxMemoKomis.Left  := 410;
        end else
        begin
                cxMemoKomis.Width := 400;
                cxMemoKomis.Left  := 231;
        end;
    end;
end;

procedure TfmBankNastroyka.cxButtonWriteClick(Sender: TObject);
var
        s:String;
begin
        if (cxCheckBoxNich.Checked = true) then check_show_nich := 1
        else check_show_nich := 0;
        pFIBQueryWrite.SQL.Clear;
        with(pFIBQueryWrite) do
        begin
                SQL.Add('update bank_ini'                                       );
                if(id_state>0)then
                        SQL.Add('BANK_ID_STATE_KOMIS='+  IntToStr(id_state)+', '                );
                if(id_group>0)then
                        SQL.Add('ID_GROUP='+  IntToStr(id_group)+', '                );
                if(id_group_add_pr>0)then
                        SQL.Add('ID_GROUP_ADD_PR='+  IntToStr(id_group_add_pr)+', '                );
                if(id_group_add_ras>0)then
                        SQL.Add('ID_GROUP_ADD_RAS='+  IntToStr(id_group_add_ras)+', '                );
                if(cxDateEditDateInstallSystem.Text<>'')then
                        SQL.Add(' BANK_INSTALL_SYSTEM  ='''+cxDateEditDateInstallSystem.Text+''','                );
                if(cxMaskDayShowLast.Text<>'')then
                        SQL.Add(' BANK_DAY_SHOW_LAST ='+cxMaskDayShowLast.Text+', '                   );
                if(MaskDay_AgoShow.Text<>'')then
                        SQL.Add(' DAY_AGO_SHOW ='+MaskDay_AgoShow.Text+', '                   );
                if(MaskDay_AgoDo.Text<>'')then
                        SQL.Add(' DAY_AGO_DO ='+MaskDay_AgoDo.Text+', '                   );
                if(id_razd > 0) then
                        SQL.Add(' BANK_ID_RAZDEL_NICH = ' + IntToStr(id_razd) +', '                   );
                if(id_dog > 0) then
                        SQL.Add(' BANK_ID_DOG_NICH = '+ IntToStr(id_dog) +', '                   );
                if(kod_dog > 0) then
                        SQL.Add(' BANK_KOD_DOG_NICH = '+ IntToStr(kod_dog) +', '                   );
                if(check_show_nich <> null) then
                        SQL.Add(' CHECK_SHOW_NICH = '+ IntToStr(check_show_nich) +', '                   );
                if(cxCheckBoxKomis.Checked)then
                begin
                        if(id_sch>0)then
                        begin
                                SQL.Add('BANK_SCH_KOMIS='+inttostr(id_sch)+ ', ');
                                SQL.Add('BANK_FLAG_SCH_KOMIS='+inttostr(1) + ', ');
                        end
                        else
                        begin
                                ShowMessage(Un_R_file_Alex.BANK_NASTROYKA_ALERT1);
                                exit;
                        end
                end
                else
                begin
                        SQL.Add('BANK_SCH_KOMIS=null'+ ', ');
                        SQL.Add('BANK_FLAG_SCH_KOMIS='+inttostr(0) + ', ');
                        id_sch := -1;
                        cxButtonKomis.Text := '';
                end;

                if(CheckBoxExpertSystem.Checked)then
                begin
                     SQL.Add('USE_EXPERT_SYSTEM='+inttostr(1) + ', ');
                end
                else
                begin
                     SQL.Add('USE_EXPERT_SYSTEM='+inttostr(0) + ', ');

                end;

                SQL.Add('USE_MOVE_ORDER_DEB_KR='+inttostr(cxComboBox1.ItemIndex) + ', ');

                if(id_dog_komis>0) and (kod_dog_komis>0) then
                begin
                        SQL.Add('BANK_ID_DOG_KOMIS = ' + IntToStr(id_dog_komis) + ', ');
                        SQL.Add('BANK_KOD_DOG_KOMIS = ' + IntToStr(kod_dog_komis) + ', ');
                end;
                if(id_kod_rs_rs_debet>0) and (kod_dog_rs_rs_debet>0) then
                begin
                        SQL.Add('ID_DOG_RS_RS_DEBET = ' + IntToStr(id_kod_rs_rs_debet) + ', ');
                        SQL.Add('KOD_DOG_RS_RS_DEBET = ' + IntToStr(kod_dog_rs_rs_debet) + ', ');
                end;
                if (id_kekv>0) then
                begin
                        SQL.Add('ID_KEKV_FOR_OLD_TRIT = ' + IntToStr(id_kekv) + ', ');
                end;
                {Подрихтовываем запрос--удаляем запятую вконце,если она там есть}
                s:=SQL.Strings[SQL.Count-1];
                if(s[length(s)-1]=',')then
                begin
                        s[length(s)-1]:=' ';
                        SQL.Delete(SQL.Count-1);
                        SQL.Add(s);
                end;
                {Подрихтовываем запрос--добавляем  во 2-й строке set}
                s:=SQL.Strings[1];
                SQL.Delete(1);
                SQL.Insert(1,'set '+s);
        end;//with

        //ShowMessage(pFIBQueryWrite.SQL.GetText); //Контроль сформированного запроса

        try
                pFIBTransactionWrite.StartTransaction;
                pFIBQueryWrite.Prepare;
                pFIBQueryWrite.ExecQuery;
                pFIBTransactionWrite.Commit;
                ShowMessage(Un_R_file_Alex.BANK_MESSAGE_SUCSESSFUL);
        except
                pFIBTransactionWrite.Rollback;
                ShowMessage(Un_R_file_Alex.BANK_MESSAGE_UN_SUCSESSFUL);
        end;
end;

procedure TfmBankNastroyka.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    if FormStyle = fsMDIChild then Action := CaFree;
    FormStorage1.SaveFormPlacement;
end;

procedure TfmBankNastroyka.cxButtonEditIDDogKomisPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    inputDog : TDogInput;
    res   : TDogResult;
begin
        SYS_ID_USER           := id_user;
        decimalseparator      := ',';
        inputDog              := SYS_DEFAULT_DOG_INPUT;
        inputDog.Owner        := Self;
        inputDog.DBHandle     := pFIBDatabase1.Handle;
        inputDog.ReadTrans    := pFIBDatabase1.DefaultTransaction.Handle;
        inputDog.WriteTrans   := pFIBTransactionWrite.Handle;
        inputDog.FormStyle    := fsNormal;

        DataSet.Close;
        DataSet.SQLs.SelectSQL.Text := 'select * from BANK_INI';
        DataSet.Open;
        inputDog.id_Group_add := DataSet.FieldByName('ID_GROUP_ADD_PR').AsInteger;//61799//1499
        inputDog.id_Group     := DataSet.FieldByName('ID_GROUP').AsInteger;//61699;//699;
        DataSet.Close;

        inputDog.Summa        := 1;
        inputDog.filter.bShowFilterForm := true;
        inputDog.isZayav     := false;
        inputDog.arndGetPay  := 1;
        res := ShowDogMain(inputDog);
        if res.ModalResult = 1 then
        begin
            id_dog_komis   := res.id_dog;
            kod_dog_komis  := res.kod_dog;
            cxButtonEditIDDogKomis.text := VarToStr(res.n_dog) +  Un_R_file_Alex.BANK_NASTROYKA_VID  + VarToStr(res.d_dog) + ' ' + VarToStr(res.name_customer) + ' (' + VarToStr(res.regest_num) + ')';
        end;
end;

procedure TfmBankNastroyka.cxButtonEditKODDogKomisPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    inputDog : TDogInput;
    res   : TDogResult;
begin
        SYS_ID_USER           := id_user;
        decimalseparator      := ',';
        inputDog              := SYS_DEFAULT_DOG_INPUT;
        inputDog.Owner        := Self;
        inputDog.DBHandle     := pFIBDatabase1.Handle;
        inputDog.ReadTrans    := pFIBDatabase1.DefaultTransaction.Handle;
        inputDog.WriteTrans   := pFIBTransactionWrite.Handle;
        inputDog.FormStyle    := fsNormal;

        DataSet.Close;
        DataSet.SQLs.SelectSQL.Text := 'select * from BANK_INI';
        DataSet.Open;
        inputDog.id_Group_add := DataSet.FieldByName('ID_GROUP_ADD_PR').AsInteger;//61799//1499
        inputDog.id_Group     := DataSet.FieldByName('ID_GROUP').AsInteger;//61699;//699;
        DataSet.Close;

        inputDog.Summa        := 1;
        inputDog.filter.bShowFilterForm := true;
        inputDog.isZayav     := false;
        inputDog.arndGetPay  := 1;
        res := ShowDogMain(inputDog);
        if res.ModalResult = 1 then
        begin
            id_kod_rs_rs_debet   := res.id_dog;
            kod_dog_rs_rs_debet  := res.kod_dog;
            cxButtonEditKODDogKomis.text := VarToStr(res.n_dog) +  Un_R_file_Alex.BANK_NASTROYKA_VID  + VarToStr(res.d_dog) + ' ' + VarToStr(res.name_customer) + ' (' + VarToStr(res.regest_num) + ')';
        end;


end;

procedure TfmBankNastroyka.cxButtonEditID_KEKVPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    res : variant;
begin
    res := GlobalSPR.GetKEKVSpr(self, pFIBDatabase1.Handle, fsNormal, date, 1);
    if VarArrayDimCount(res) > 0 then
    begin
        if (res[0][0]<>null) and (res[0][1]<>null) then
        begin
            id_kekv             := res[0][0];
            cxButtonEditID_KEKV.Text  := VarToStr(res[0][2]) + ' ' +VarToStr(res[0][1]);
        end;
    end;


end;

procedure TfmBankNastroyka.FormCreate(Sender: TObject);
begin
    FormStorage1.RestoreFormPlacement;
end;



procedure TfmBankNastroyka.cxButtonDogPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    inputDog : TDogInput;
    res   : TDogResult;
    error: Integer;
begin
        error := fibCheckPermission('/ROOT/Bank/Work/Work_with_RS/Bank_document/BANK_VIEW_SHABLON','Belong');
        if (error <> 0) then
        begin
          ShowMessage('У Вас не вистачає прав для зміни договору для шаблону НІЧ! Зверніться до адміністратора!');
          Exit;
        end;
        SYS_ID_USER           := id_user;
        decimalseparator      := ',';
        inputDog              := SYS_DEFAULT_DOG_INPUT;
        inputDog.Owner        := Self;
        inputDog.DBHandle     := pFIBDatabase1.Handle;
        inputDog.ReadTrans    := pFIBDatabase1.DefaultTransaction.Handle;
        inputDog.WriteTrans   := pFIBTransactionWrite.Handle;
        inputDog.FormStyle    := fsNormal;

        DataSet.Close;
        DataSet.SQLs.SelectSQL.Text := 'select * from BANK_INI';
        DataSet.Open;
        inputDog.id_Group_add := DataSet.FieldByName('ID_GROUP_ADD_PR').AsInteger;//61799//1499
        inputDog.id_Group     := DataSet.FieldByName('ID_GROUP').AsInteger;//61699;//699;
        DataSet.Close;

        inputDog.Summa        := 1;
        inputDog.filter.bShowFilterForm := true;
        inputDog.isZayav     := false;
        inputDog.arndGetPay  := 1;
        res := ShowDogMain(inputDog);
        if res.ModalResult = 1 then
        begin
            id_dog   := res.id_dog;
            kod_dog  := res.kod_dog;
            cxButtonDog.text := VarToStr(res.n_dog) +  Un_R_file_Alex.BANK_NASTROYKA_VID  + VarToStr(res.d_dog) + ' ' + VarToStr(res.name_customer) + ' (' + VarToStr(res.regest_num) + ')';
        end;
end;

procedure TfmBankNastroyka.cxButtonRazdPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  Res : Variant;
  ResCount, i, error : Integer;
  GetNameSP : TPfibStoredProc;
  num, text : string;
begin
  error := fibCheckPermission('/ROOT/Bank/Work/Work_with_RS/Bank_document/BANK_VIEW_SHABLON','Belong');
  if (error <> 0) then
  begin
    ShowMessage('У Вас не вистачає прав для зміни розділу для шаблону НІЧ! Зверніться до адміністратора!');
    Exit;
  end;
  Res:=GlobalSpr.GetRazdStSpr(self, pFIBDatabase1.Handle, fsNormal, Date, 0, allOnlyRazd, cmRazd);
  if Res<>null
  then begin
            id_razd:=Res;
            GetNameSP:=TPfibStoredProc.Create(self);
            GetNameSP.Database:=pFIBDatabase1;
            GetNameSP.Transaction:=pFIBTransactionBase;
            pFIBTransactionBase.StartTransaction;
            GetNameSP.StoredProcName:='PUB_SPR_RAZD_ST_INFO';
            GetNameSP.Prepare;
            GetNameSP.ParamByName('ID_RAZD_ST_IN').Value:=id_razd;
            GetNameSP.ExecProc;
            num:=GetNameSP.ParamByName('RAZD_ST_NUM').AsString;
            text:=GetNameSP.ParamByName('RAZD_ST_TITLE').AsString;
            GetNameSP.Close;
            GetNameSP.Free;
            pFIBTransactionBase.Commit;
            cxButtonRazd.Text:=num+' '+text;
  end;
 end; 



end.
