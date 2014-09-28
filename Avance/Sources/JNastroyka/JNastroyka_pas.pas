{***************************************************************
* Unit JNastroyka.					       *
*							       *
* Описание предназначения(работы) модуля: настройка J          *
* Copyright ©  Год 2006, Автор: Ворновских Макс                *
***************************************************************}

unit JNastroyka_pas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FIBDatabase, pFIBDatabase,Un_lo_file_Alex,
  cxLookAndFeelPainters, cxMaskEdit, cxButtonEdit, StdCtrls, cxButtons,
  ExtCtrls, cxTextEdit, cxMemo, cxControls, cxContainer, cxEdit, cxCheckBox,
  cxDropDownEdit, cxCalendar, DB, FIBDataSet, pFIBDataSet, FIBQuery,
  pFIBQuery;

type
  TfmJNastroyka = class(TForm)
    pFIBDatabase1: TpFIBDatabase;
    cxCheckBoxRasshifr: TcxCheckBox;
    cxMemoRasshifr: TcxMemo;
    Panel1: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxButtonEditSmeta: TcxButtonEdit;
    cxMemoSmeta: TcxMemo;
    cxMemoRazdel: TcxMemo;
    cxButtonEditRazdel: TcxButtonEdit;
    cxButtonEditState: TcxButtonEdit;
    cxMemoState: TcxMemo;
    cxMemoID_KEKV: TcxMemo;
    cxButtonEditID_KEKV: TcxButtonEdit;
    cxCheckBoxShowDebet: TcxCheckBox;
    cxMemoShowDebet: TcxMemo;
    cxMaskDayShowLast: TcxMaskEdit;
    cxMemoDayShowLast: TcxMemo;
    cxCheckBoxNewAlg: TcxCheckBox;
    cxMemoAlg: TcxMemo;
    cxDateEditDateNewAlg: TcxDateEdit;
    pFIBTransactionBase: TpFIBTransaction;
    cxCheckBoxShowNeosnProv: TcxCheckBox;
    cxMemoShowNeosnProv: TcxMemo;
    cxCheckBoxDelBuf: TcxCheckBox;
    cxMemoDelBuf: TcxMemo;
    cxButtonEditGroupAddRas: TcxButtonEdit;
    cxMemoGroupAddRas: TcxMemo;
    cxMemoKODDogKomis: TcxMemo;
    cxButtonEditKODDogKomis: TcxButtonEdit;
    cxButtonEditPrih: TcxButtonEdit;
    cxMemoPrih: TcxMemo;
    pFIBTransactionRead: TpFIBTransaction;
    pFIBTransactionWrite: TpFIBTransaction;
    pFIBQueryInsert: TpFIBQuery;
    pFIBDataSet: TpFIBDataSet;
    pFIBDataSetForProcs: TpFIBDataSet;
    cxCheckBoxShowKom: TcxCheckBox;
    cxMemoShowKom: TcxMemo;
    cxCheckBoxShowShablons: TcxCheckBox;
    cxMemoShowShablons: TcxMemo;
    cxCheckBoxUseAccess: TcxCheckBox;
    cxMemoUseAccess: TcxMemo;
    cxMemoReestrTitle: TcxMemo;
    cxMemoHead: TcxMemo;
    CheckBoxNewNumAlg: TcxCheckBox;
    MemoNewNumAlg: TcxMemo;
    DateEditNewNumAlg: TcxDateEdit;
    MemoDatNewNumAlg: TcxMemo;
    ButtonEditFioCheck: TcxButtonEdit;
    MemoFioCheck: TcxMemo;
    ButtonEditGlBuhg: TcxButtonEdit;
    MemoGlBuh: TcxMemo;
    CheckBoxMoPrintDocOst: TcxCheckBox;
    MemoMOPrintDocOst: TcxMemo;
    CheckBox_MO_PRINT_ONLY_VIKON: TCheckBox;
    Memo_MO_PRINT_ONLY_VIKON: TcxMemo;
    Memo_J4_IS_DEFAULT_COMMENT_VEDOMOST: TcxMemo;
    Memo_J4_DEFAULT_COMMENT_VEDOMOST: TcxMemo;
    Memo_J4_DEFAULT_COMMENT_VEDOMOST_VAL: TcxMemo;
    CheckBox_J4_IS_DEFAULT_COMMENT_VEDOMOST: TcxCheckBox;
    Memo_IS_SELECT_TYPE_VVOD_VEDOM: TcxMemo;
    CheckBox_IS_SELECT_TYPE_VVOD_VEDOM: TcxCheckBox;
    Memo_J4_IS_PRINT_NAKAZ_IN_VEDOM_AV_O: TcxMemo;
    CheckBox_J4_IS_PRINT_NAKAZ_IN_VEDOM_AV_O: TcxCheckBox;
    Memo_IS_SELECT_TYPE_DOC_AV_O: TcxMemo;
    CheckBox_IS_SELECT_TYPE_DOC: TcxCheckBox;
    CheckBox_IS_VIEW_MO_ZVED_ZVIT: TcxCheckBox;
    Memo_IS_VIEW_MO_ZVED_ZVIT: TcxMemo;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxCheckBoxNewAlgPropertiesChange(Sender: TObject);
    procedure cxButtonEditSmetaPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonEditRazdelPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonEditStatePropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonEditID_KEKVPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonEditKODDogKomisPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonEditPrihPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonEditGroupAddRasPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButton1Click(Sender: TObject);
    procedure ButtonEditFioCheckPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure ButtonEditGlBuhgPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure CheckBoxNewNumAlgPropertiesChange(Sender: TObject);
    procedure CheckBox_J4_IS_DEFAULT_COMMENT_VEDOMOSTClick(
      Sender: TObject);
  private
    { Private declarations }
    id_user : int64;

  public
    { Public declarations }
    {Для запоминания возвращаемых идентификаторов}
    id_smeta, id_razd, id_state, id_kekv : int64;
    id_group:               int64;          
    id_group_add_pr:        int64;
    id_group_add_ras:       int64;
    id_man_check, id_man_gl_bug : int64;

    constructor Create(AOwner : TComponent; id_us : int64; DB : TpFIBDatabase); reintroduce;
  end;

var
  fmJNastroyka: TfmJNastroyka;

function JNastroyka(AOwner : TComponent; id_us : int64; DB : TpFIBDatabase) : Integer; stdcall;
  exports JNastroyka;

implementation
uses GlobalSPR,  LoadDogManedger, Un_R_file_Alex;
{$R *.dfm}

function JNastroyka(AOwner : TComponent; id_us : int64; DB : TpFIBDatabase) : Integer; stdcall;
var
    T : TfmJNastroyka;
begin
    T := TfmJNastroyka.Create(AOwner, id_us, DB);
    T.Show;
    result := -1;
end;


constructor TfmJNastroyka.Create(AOwner : TComponent; id_us : int64; DB : TpFIBDatabase);
begin
        inherited Create(AOwner);
        pFIBDatabase1 := DB;
        id_user := id_us;
        {Инициализация ФИБОВ}
        pFIBTransactionBase.DefaultDatabase     := pFIBDatabase1;
        pFIBDatabase1.DefaultTransaction        := pFIBTransactionBase;
        pFIBTransactionBase.StartTransaction;
        pFIBTransactionRead.DefaultDatabase     := pFIBDatabase1;
        pFIBTransactionWrite.DefaultDatabase    := pFIBDatabase1;

        pFIBQueryInsert.Transaction             := pFIBTransactionWrite;
        pFIBQueryInsert.Database                := pFIBDatabase1;

        pFIBDataSet.Database                    := pFIBDatabase1;
        pFIBDataSet.Transaction                 := pFIBTransactionRead;

        pFIBDataSetForProcs.Database            := pFIBDatabase1;
        pFIBDataSetForProcs.Transaction         := pFIBTransactionRead;
        {//}
        {Инициализация констант}
        cxMemoRasshifr.Text                      := Un_R_file_Alex.JNASTROYKA_RAZCHIFROVKA;
        cxMemoSmeta.Text                         := Un_R_file_Alex.JNASTROYKA_SMETA;
        cxMemoRazdel.Text                        := Un_R_file_Alex.JNASTROYKA_RAZDEL;
        cxMemoState.Text                         := Un_R_file_Alex.JNASTROYKA_STATE;
        cxMemoID_KEKV.Text                       := Un_R_file_Alex.JNASTROYKA_KEKV;
        cxMemoShowDebet.Text                     := Un_R_file_Alex.JNASTROYKA_SHOW_DEBET;
        cxMemoDayShowLast.Text                   := Un_R_file_Alex.JNASTROYKA_DAY_SHOW_LAST;
        cxMemoAlg.Text                           := Un_R_file_Alex.JNASTROYKA_NEW_ALGORYTHM;
        cxMemoShowNeosnProv.Text                 := Un_R_file_Alex.JNASTROYKA_SHOW_NEOSN_PROV;
        cxMemoDelBuf.Text                        := Un_R_file_Alex.JNASTROYKA_DEL_BUFFER;
        cxMemoGroupAddRas.Text                   := Un_R_file_Alex.JNASTROYKA_ID_GROUP_ADD_RAS;
        cxMemoKODDogKomis.Text                   := Un_R_file_Alex.JNASTROYKA_ID_GROUP;
        cxMemoPrih.Text                          := Un_R_file_Alex.JNASTROYKA_ID_GROUP_ADD_PR;
        cxMemoShowKom.Text                       := Un_R_file_Alex.JNASTROYKA_SHOW_KOM;
        cxMemoShowShablons.Text                  := Un_R_file_Alex.J4_SHOW_SHABLONS;
        cxMemoUseAccess.Text                     := Un_R_file_Alex.J4_ACCESS_DIVIDE;
        cxMemoHead.Text                          := Un_R_file_Alex.J4_HEAD_PRINT_REEST;
        Caption                                  := Un_R_file_Alex.JNASTROYKA_FORM_CAPTION;
        MemoNewNumAlg.Text                       := Un_R_file_Alex.J4_USE_ALG_FORM_NEW_NUM_AO;
        MemoDatNewNumAlg.Text                    := Un_R_file_Alex.J4_DATE_ALG_FORM_NEW_NUM_AO;
        MemoFioCheck.Text                        := Un_R_file_Alex.J4_FIO_CHECK_REPORT;
        MemoGlBuh.Text                           := Un_R_file_Alex.J4_FIO_GL_BUHG_REPORT;
        MemoMOPrintDocOst.Text                   := Un_R_file_Alex.J4_MO_PRINT_DOC_OST;
        Memo_MO_PRINT_ONLY_VIKON.Text            := Un_R_file_Alex.J4_MO_PRINT_ONLY_VIKON;
        Memo_J4_IS_DEFAULT_COMMENT_VEDOMOST.Text := Un_R_file_Alex.J4_IS_DEFAULT_COMMENT_VEDOMOST;
        Memo_J4_DEFAULT_COMMENT_VEDOMOST.Text    := Un_R_file_Alex.J4_DEFAULT_COMMENT_VEDOMOST;
        Memo_IS_SELECT_TYPE_VVOD_VEDOM.Text      := Un_R_file_Alex.J4_IS_SELECT_TYPE_VVOD_VEDOM;
        Memo_J4_IS_PRINT_NAKAZ_IN_VEDOM_AV_O.Text := 'Друкувати № та дату наказу у реєстрі відомостей, створених через ав.звіти';
        Memo_IS_SELECT_TYPE_DOC_AV_O.Text        := 'Обирати тип документа при створенні авансового звіту';
        Memo_IS_VIEW_MO_ZVED_ZVIT.Text           := 'Формування меморіального ордеру (зведена)';
        {//}
{~~~~~~~~~~~~~~~~~~~~~~~~~~~~~Загрузка данных из БД при старте~~~~~~~~~~~~~~~~~}
        pFIBDataSet.Close;
        pFIBDataSet.Sqls.SelectSql.Text := 'SELECT * FROM J4_INI';
        pFIBDataSet.Open;
        if pFIBDataset.RecordCount > 0 then
        begin
                if not pFIBDataset.FBN('RAZSCHIFROVKA').IsNull then
                        cxCheckBoxRasshifr.EditValue := pFIBDataset.FBN('RAZSCHIFROVKA').AsInteger;

                if(not pFIBDataSet.FieldByName('J4_SMETA').IsNull) then
                begin
                        id_smeta := StrToInt64(pFIBDataSet.FieldByName('J4_SMETA').AsString);
                        pFIBDataSetForProcs.SQLs.SelectSQL.Text := 'SELECT * FROM pub_get_name_budg_by_id('+IntToStr(id_smeta)+', '''+DateToStr(Date)+''', '+IntToStr(1)+')';
                        pFIBDataSetForProcs.Open;
                        cxButtonEditSmeta.Text := pFIBDataSetForProcs.FieldByName('KOD_OBJECT').AsString + ' - ' + pFIBDataSetForProcs.FieldByName('TITLE_OBJECT').AsString;
                        pFIBDataSetForProcs.Close;
                end
                else
                        id_smeta:=-1;

                if(not pFIBDataSet.FieldByName('J4_RAZDEL').IsNull)then
                begin
                        id_razd := StrToInt64(pFIBDataSet.FieldByName('J4_RAZDEL').AsString);
                        pFIBDataSetForProcs.Close;
                        pFIBDataSetForProcs.SQLs.SelectSQL.Text := 'SELECT * FROM pub_get_name_budg_by_id('+IntToStr(id_razd)+', '''+DateToStr(Date)+''', '+IntToStr(2)+')';
                        pFIBDataSetForProcs.Open;
                        cxButtonEditRazdel.Text := pFIBDataSetForProcs.FieldByName('KOD_OBJECT').AsString + ' - ' + pFIBDataSetForProcs.FieldByName('TITLE_OBJECT').AsString;
                        pFIBDataSetForProcs.Close;
                end
                else
                begin
                        id_razd:=-1;
                end;

                if(not pFIBDataSet.FieldByName('J4_STATE').IsNull)then
                begin
                        id_state := StrToInt64(pFIBDataSet.FieldByName('J4_STATE').AsString);
                        pFIBDataSetForProcs.Close;
                        pFIBDataSetForProcs.SQLs.SelectSQL.Text := 'SELECT * FROM pub_get_name_budg_by_id('+IntToStr(id_state)+', '''+DateToStr(Date)+''', '+IntToStr(3)+')';
                        pFIBDataSetForProcs.Open;
                        cxButtonEditState.Text := pFIBDataSetForProcs.FieldByName('KOD_OBJECT').AsString + ' - ' + pFIBDataSetForProcs.FieldByName('TITLE_OBJECT').AsString;
                        pFIBDataSetForProcs.Close;
                end
                else
                begin
                        id_state:=-1;
                end;

                if(not pFIBDataSet.FieldByName('J4_KEKV').IsNull)then
                begin
                        id_kekv := StrToInt64(pFIBDataSet.FieldByName('J4_KEKV').AsString);
                        pFIBDataSetForProcs.Close;
                        pFIBDataSetForProcs.Sqls.SelectSql.Text := 'Select * from PUB_SPR_KEKV_INFO('+IntToStr(id_kekv)+', '''+DateToStr(date)+''')';
                        pFIBDataSetForProcs.Open;
                        cxButtonEditID_KEKV.Text := pFIBDataSetForProcs.FBN('KEKV_KODE').AsString + ' ' + pFIBDataSetForProcs.FBN('KEKV_TITLE').AsString;
                end;

                if not pFIBDataset.FBN('SHOW_DEBET').IsNull then
                        cxCheckBoxShowDebet.EditValue := pFIBDataset.FBN('SHOW_DEBET').AsInteger;

                if not pFIBDataset.FBN('NO_VIS_DATE_KOM').IsNull then
                        cxCheckBoxShowKom.EditValue := pFIBDataset.FBN('NO_VIS_DATE_KOM').AsInteger;

                if not pFIBDataset.FBN('SHOW_SHABLONS').IsNull then
                        cxCheckBoxShowShablons.EditValue := pFIBDataset.FBN('SHOW_SHABLONS').AsInteger;

                if not pFIBDataset.FBN('USE_ACCESS').IsNull then
                        cxCheckBoxUseAccess.EditValue := pFIBDataset.FBN('USE_ACCESS').AsInteger;

                if not pFIBDataset.FBN('J4_MO_PRINT_DOC_OST').IsNull then
                        CheckBoxMoPrintDocOst.EditValue := pFIBDataset.FBN('J4_MO_PRINT_DOC_OST').AsInteger;

                if pFIBDataset.FBN('J4_MO_PRINT_ONLY_VIKON').asinteger = 1 then
                  begin
                   CheckBox_MO_PRINT_ONLY_VIKON.Checked := true;
                  end
                else
                  begin
                    CheckBox_MO_PRINT_ONLY_VIKON.Checked := False;
                  end;

                if pFIBDataset.FBN('J4_IS_SELECT_TYPE_VVOD_VEDOM').asinteger = 1 then
                  begin
                   CheckBox_IS_SELECT_TYPE_VVOD_VEDOM.Checked := true;
                  end
                else
                  begin
                    CheckBox_IS_SELECT_TYPE_VVOD_VEDOM.Checked := False;
                  end;

                if pFIBDataset.FBN('J4_IS_PRINT_NAKAZ_IN_VEDOM_AV_O').asinteger = 1 then
                  begin
                   CheckBox_J4_IS_PRINT_NAKAZ_IN_VEDOM_AV_O.Checked := true;
                  end
                else
                  begin
                    CheckBox_J4_IS_PRINT_NAKAZ_IN_VEDOM_AV_O.Checked := False;
                  end;

                if pFIBDataset.FBN('J4_IS_SELECT_TYPE_DOC_AV_O').asinteger = 1 then
                  begin
                   CheckBox_IS_SELECT_TYPE_DOC .Checked := true;
                  end
                else
                  begin
                    CheckBox_IS_SELECT_TYPE_DOC.Checked := False;
                  end;

                if pFIBDataset.FBN('J4_IS_VIEW_MO_ZVED_ZVIT').asinteger = 1 then
                  begin
                   CheckBox_IS_VIEW_MO_ZVED_ZVIT .Checked := true;
                  end
                else
                  begin
                    CheckBox_IS_VIEW_MO_ZVED_ZVIT.Checked := False;
                  end;

                if pFIBDataset.FBN('J4_IS_DEFAULT_COMMENT_VEDOMOST').asinteger = 1 then
                  begin
                   CheckBox_J4_IS_DEFAULT_COMMENT_VEDOMOST.Checked := true;
                   Memo_J4_DEFAULT_COMMENT_VEDOMOST_VAL.text := pFIBDataSet['J4_DEFAULT_COMMENT_VEDOMOST'];
                  end
                else
                  begin
                    CheckBox_J4_IS_DEFAULT_COMMENT_VEDOMOST.Checked := False;
                    Memo_J4_DEFAULT_COMMENT_VEDOMOST_VAL.text := '';
                  end;

                if not pFIBDataset.FBN('USE_NEW_ALG_FOR_NUM_AO').IsNull then
                        CheckBoxNewNumAlg.EditValue := pFIBDataset.FBN('USE_NEW_ALG_FOR_NUM_AO').AsInteger;

                if not pFIBDataset.FBN('COMMENT_REESTR').IsNull then
                        cxMemoReestrTitle.Text := pFIBDataset.FBN('COMMENT_REESTR').AsString;

                if(not pFIBDataSet.FieldByName('J4_DAY_SHOW_LAST').IsNull)then
                        cxMaskDayShowLast.Text:=pFIBDataSet.FieldByName('J4_DAY_SHOW_LAST').AsString;

                if(not pFIBDataSet.FieldByName('FLAG_NEW_ALGORITHM').IsNull)then
                        cxCheckBoxNewAlg.EditValue := pFIBDataSet.FieldByName('FLAG_NEW_ALGORITHM').AsInteger;

                if(not pFIBDataSet.FieldByName('DATE_NEW_ALGORITHM').IsNull) then
                        cxDateEditDateNewAlg.EditValue := pFIBDataSet.FieldByName('DATE_NEW_ALGORITHM').AsDateTime;

                if(not pFIBDataSet.FieldByName('DATE_NEW_ALG_FOR_NUM_AO').IsNull) then
                        DateEditNewNumAlg.EditValue := pFIBDataSet.FieldByName('DATE_NEW_ALG_FOR_NUM_AO').AsDateTime;

                if(not pFIBDataSet.FieldByName('SHOW_NEOSNOV_PROV').IsNull)then
                        cxCheckBoxShowNeosnProv.EditValue := pFIBDataSet.FieldByName('SHOW_NEOSNOV_PROV').AsInteger;

                if(not pFIBDataSet.FieldByName('DEL_BUFFER').IsNull)then
                        cxCheckBoxDelBuf.EditValue := pFIBDataSet.FieldByName('DEL_BUFFER').AsInteger;

                if(not pFIBDataSet.FBN('ID_GROUP').IsNull) then
                        id_group:=StrToInt64(pFIBDataSet.FieldByName('ID_GROUP').AsString)
                else
                        id_group:=-1;
                        
{Забираем  'ID_GROUP'}
                if(id_group>0)then
                begin
                        try
                                pFIBDataSetForProcs.Close;
                                pFIBDataSetForProcs.SQLs.SelectSQL.Clear;
                                pFIBDataSetForProcs.SQLs.SelectSQL.Add('select * from DOG_DT_GROUP_DOC where ID_GROUP_DOC = :id');
                                pFIBDataSetForProcs.ParamByName('id').AsInt64:=id_group;
                                pFIBDataSetForProcs.Open;
                                //выводим короткое имя

                                cxButtonEditKODDogKomis.Text:=pFIBDataSetForProcs.FBN('NAME_GROUP_DOC').AsString;
                        except
                                //pFIBTransaction_Get_Group.Rollback;
                        end;
                end;

{Забираем  'ID_GROUP_ADD_PR'}
                if(not pFIBDataSet.FBN('ID_GROUP_ADD_PR').IsNull) then
                        id_group_add_pr:=StrToInt64(pFIBDataSet.FieldByName('ID_GROUP_ADD_PR').AsString)
                else
                        id_group_add_pr:=-1;

                if(id_group_add_pr>0)then
                begin
                        try
                                pFIBDataSetForProcs.Close;
                                pFIBDataSetForProcs.SQLs.SelectSQL.Clear;
                                pFIBDataSetForProcs.SQLs.SelectSQL.Add('select * from DOG_DT_GROUP_DOC where ID_GROUP_DOC = :id');
                                pFIBDataSetForProcs.ParamByName('id').AsInt64:=id_group_add_pr;
                                pFIBDataSetForProcs.Open;
                                //выводим короткое имя
                                cxButtonEditPrih.Text:= pFIBDataSetForProcs.FBN('NAME_GROUP_DOC').AsString;
                        except
                                //pFIBTransaction_Get_Group.Rollback;
                        end;
                end;

{Забираем  'ID_GROUP_ADD_RAS'}
                if(not pFIBDataSet.FBN('ID_GROUP_ADD_RAS').IsNull) then
                        id_group_add_ras:=StrToInt64(pFIBDataSet.FieldByName('ID_GROUP_ADD_RAS').AsString)
                else
                        id_group_add_ras:=-1;

                if(id_group_add_ras>0)then
                begin
                        try
                                pFIBDataSetForProcs.Close;
                                pFIBDataSetForProcs.SQLs.SelectSQL.Clear;
                                pFIBDataSetForProcs.SQLs.SelectSQL.Add('select * from DOG_DT_GROUP_DOC where ID_GROUP_DOC = :id');
                                pFIBDataSetForProcs.ParamByName('id').AsInt64:=id_group_add_ras;
                                pFIBDataSetForProcs.Open;
                                //выводим короткое имя
                                cxButtonEditGroupAddRas.Text:= pFIBDataSetForProcs.FBN('NAME_GROUP_DOC').AsString;
                        except
                                //pFIBTransaction_Get_Group.Rollback;
                        end;
                end;

                 if(not pFIBDataSet.FBN('ID_MEN_CHECK').IsNull) then
                        id_man_check:=StrToInt64(pFIBDataSet.FieldByName('ID_MEN_CHECK').AsString)
                else
                        id_man_check:=-1;

                if(id_man_check>0)then
                begin
                        try
                                pFIBDataSetForProcs.Close;
                                pFIBDataSetForProcs.SQLs.SelectSQL.Clear;
                                pFIBDataSetForProcs.SQLs.SelectSQL.Text :='select * from PUB_GET_MAN_INFO('+IntToStr(id_man_check)+', '''+DateToStr(Date)+''')';
                                pFIBDataSetForProcs.Open;

                                ButtonEditFioCheck.Text:= pFIBDataSetForProcs.FBN('ukr_familia').AsString+' '+pFIBDataSetForProcs.FBN('ukr_imya').AsString+' '+pFIBDataSetForProcs.FBN('ukr_otchestvo').AsString;
                                pFIBDataSetForProcs.Close;
                        except
                                //pFIBTransaction_Get_Group.Rollback;
                        end;
                end;

                  if(not pFIBDataSet.FBN('ID_MEN_GL_BUHG').IsNull) then
                        id_man_gl_bug:=StrToInt64(pFIBDataSet.FieldByName('ID_MEN_GL_BUHG').AsString)
                else
                        id_man_gl_bug:=-1;

                if(id_man_gl_bug>0)then
                begin
                        try
                                pFIBDataSetForProcs.Close;
                                pFIBDataSetForProcs.SQLs.SelectSQL.Clear;
                                pFIBDataSetForProcs.SQLs.SelectSQL.Text :='select * from PUB_GET_MAN_INFO('+IntToStr(id_man_gl_bug)+', '''+DateToStr(Date)+''')';
                                pFIBDataSetForProcs.Open;

                                ButtonEditGlBuhg.Text:= pFIBDataSetForProcs.FBN('ukr_familia').AsString+' '+pFIBDataSetForProcs.FBN('ukr_imya').AsString+' '+pFIBDataSetForProcs.FBN('ukr_otchestvo').AsString;
                                pFIBDataSetForProcs.Close;
                        except
                                //pFIBTransaction_Get_Group.Rollback;
                        end;
                end;


        end; //RecordCount > 0
        pFIBTransactionRead.Commit;
end;
procedure TfmJNastroyka.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    if FormStyle = fsMDIChild then Action := CaFree;
end;

procedure TfmJNastroyka.FormCreate(Sender: TObject);
begin
        FormStyle := fsMDIChild;
end;

procedure TfmJNastroyka.FormDestroy(Sender: TObject);
begin
        if pFIBTransactionBase.Active then
                pFIBTransactionBase.Commit;
end;

procedure TfmJNastroyka.cxButton2Click(Sender: TObject);
begin
        if pFIBTransactionBase.Active then
                pFIBTransactionBase.Rollback;
        Close;
end;

procedure TfmJNastroyka.cxCheckBoxNewAlgPropertiesChange(Sender: TObject);
begin
        if cxCheckBoxNewAlg.Checked then
                cxDateEditDateNewAlg.Enabled := true
        else
        begin
                cxDateEditDateNewAlg.Enabled := false;
                cxDateEditDateNewAlg.EditValue := '';
        end;
end;

procedure TfmJNastroyka.cxButtonEditSmetaPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    rr : variant;
begin
    rr := GlobalSPR.GetSmets(Self, pFIBDatabase1.Handle, date, psmSmet);
    if VarArrayDimCount(rr)>0 then
    begin
        if rr[0]<>NULL then
        begin
            id_smeta           := rr[0];
            cxButtonEditSmeta.Text := VarToStr(rr[3]) + ' ' + VarToStr(rr[2]);
        end;
    end;
end;


procedure TfmJNastroyka.cxButtonEditRazdelPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    rr : variant;
begin
    rr := GlobalSPR.GetRazdStSpr(Self, pFIBDatabase1.Handle, fsNormal, date, 0, allEnable, cmRazd);
    begin
        id_razd := rr;
        if(id_razd=0) then          //Пофиксил, чтобы не записывал в поле бред, если справочник просто закрыт
          id_razd:=-1
        else
          id_razd:=id_razd;
        pFIBDataSet.Close;
        pFIBDataSet.SQLs.SelectSQL.Text := 'SELECT * FROM pub_get_name_budg_by_id('+IntToStr(id_razd)+', '''+DateToStr(Date)+''', '+IntToStr(2)+')';
        pFIBDataSet.Open;
        cxButtonEditRazdel.Text := pFIBDataSet.FieldByName('KOD_OBJECT').AsString + ' - ' + pFIBDataSet.FieldByName('TITLE_OBJECT').AsString;
        pFIBDataSet.Close;
    end;
end;

procedure TfmJNastroyka.cxButtonEditStatePropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    rr : variant;
begin
    rr := GlobalSPR.GetRazdStSpr(Self, pFIBDatabase1.Handle, fsNormal, date, 0, allEnable, cmSt);
    try
    begin
        id_state := rr;        //Пофиксил, чтобы не записывал в поле бред, если справочник просто закрыт
        if(id_state=0) then
          id_state:=-1
        else
          id_state:=id_state;
        pFIBDataSet.Close;
        pFIBDataSet.SQLs.SelectSQL.Text := 'SELECT * FROM pub_get_name_budg_by_id('+IntToStr(id_state)+', '''+DateToStr(Date)+''', '+IntToStr(3)+')';
        pFIBDataSet.Open;
        cxButtonEditState.Text := pFIBDataSet.FieldByName('KOD_OBJECT').AsString + ' - ' + pFIBDataSet.FieldByName('TITLE_OBJECT').AsString;
        pFIBDataSet.Close;
    end;
    except
    end;

end;


procedure TfmJNastroyka.cxButtonEditID_KEKVPropertiesButtonClick(
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


procedure TfmJNastroyka.cxButtonEditKODDogKomisPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    Group : variant;
    Cnt ,i   : integer;
begin
    Group := LoadDogManedger.WorkGroupDoc(self, pFIBDatabase1.Handle, fsNormal, 'tip_dog');
    if VarArrayDimCount(Group) > 0 then
    begin
        Cnt := VarArrayHighBound(Group, 1);
        id_group := group[0][0];
        cxButtonEditKODDogKomis.Text := String(group[0][1]);
    end;

end;
procedure TfmJNastroyka.cxButtonEditPrihPropertiesButtonClick(
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
        cxButtonEditPrih.Text := String(group[0][1]);
    end;
end;

procedure TfmJNastroyka.cxButtonEditGroupAddRasPropertiesButtonClick(
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
procedure TfmJNastroyka.cxButton1Click(Sender: TObject);
var
        s: String;
begin
       {id_smeta, id_razd, id_state, id_kekv : int64;
        id_group:               int64;
        id_group_add_pr:        int64;
        id_group_add_ras:       int64;}

        if ((CheckBox_J4_IS_DEFAULT_COMMENT_VEDOMOST.Checked = true) and (Memo_J4_DEFAULT_COMMENT_VEDOMOST_VAL.Text =''))then
        begin
          ShowMessage('заповніть коментар відомості або зніміть галочку ');
          Memo_J4_DEFAULT_COMMENT_VEDOMOST_VAL.SetFocus;
          Exit;
        end;

        pFIBQueryInsert.SQL.Clear;
        with(pFIBQueryInsert) do
        begin
                SQL.Add('update J4_INI');
                if(String(cxCheckBoxRasshifr.EditValue)<>'')then
                        SQL.Add(' RAZSCHIFROVKA='+      String(cxCheckBoxRasshifr.EditValue)+', '            );   // В строке ', ' пробел ОБЯЗАТЕЛЕН
                if(id_smeta>=0)then
                        SQL.Add('J4_SMETA           = '+ IntToStr(id_smeta)       +', '        );
                if(id_razd>=0)then
                        SQL.Add(' J4_RAZDEL             = '+ inttostr(id_razd) +', '        );
                if(id_state>=0)then
                        SQL.Add(' J4_STATE               = '+ inttostr(id_state)   +', '        );
                if (id_kekv>0) then
                begin
                        SQL.Add('J4_KEKV = ' + IntToStr(id_kekv) + ', ');
                end;
                if(String(cxCheckBoxShowDebet.EditValue)<>'')then
                        SQL.Add(' SHOW_DEBET='+      String(cxCheckBoxShowDebet.EditValue)+', '            );

                if(String(cxCheckBoxShowKom.EditValue)<>'')then
                        SQL.Add(' NO_VIS_DATE_KOM='+      String(cxCheckBoxShowKom.EditValue)+', '            );

                if(String(cxCheckBoxShowShablons.EditValue)<>'')then
                        SQL.Add(' SHOW_SHABLONS='+      String(cxCheckBoxShowShablons.EditValue)+', '            );

                if(String(cxCheckBoxUseAccess.EditValue)<>'')then
                        SQL.Add(' USE_ACCESS='+      String(cxCheckBoxUseAccess.EditValue)+', '            );

                if(String(CheckBoxMoPrintDocOst.EditValue)<>'')then
                        SQL.Add(' J4_MO_PRINT_DOC_OST='+      String(CheckBoxMoPrintDocOst.EditValue)+', '            );

                if(cxMemoReestrTitle.Text<>'')then
                        SQL.Add(' COMMENT_REESTR='''+cxMemoReestrTitle.Text+''', '                   );

                if(cxMaskDayShowLast.Text<>'')then
                        SQL.Add(' J4_DAY_SHOW_LAST ='+cxMaskDayShowLast.Text+', '                   );

                if(cxCheckBoxNewAlg.Checked)then
                begin
                        if(String(cxDateEditDateNewAlg.EditValue)<>'')then
                        begin
                                SQL.Add('FLAG_NEW_ALGORITHM='+String(cxCheckBoxNewAlg.EditValue)+ ', ');
                                SQL.Add(' DATE_NEW_ALGORITHM  ='''+cxDateEditDateNewAlg.Text+''','                );
                        end
                        else
                        begin
                                MessageBox(self.Handle, PAnsiChar(Un_R_file_Alex.J4_ALERT_CHOOSE_DATE_ALG),PAnsiChar(Un_R_file_Alex.J4_CAPTION_MSG), MB_OK + MB_ICONWARNING);
                                cxDateEditDateNewAlg.SetFocus;
                                exit;
                        end
                end
                else
                begin
                        SQL.Add('FLAG_NEW_ALGORITHM=0'+ ', ');
                        SQL.Add('DATE_NEW_ALGORITHM=null' + ', ');
                end;

                if(CheckBoxNewNumAlg.Checked)then
                begin
                        if(String(DateEditNewNumAlg.EditValue)<>'')then
                        begin
                                SQL.Add(' USE_NEW_ALG_FOR_NUM_AO='+String(CheckBoxNewNumAlg.EditValue)+ ', ');
                                SQL.Add(' DATE_NEW_ALG_FOR_NUM_AO  ='''+DateEditNewNumAlg.Text+''','                );
                        end
                        else
                        begin
                                MessageBox(self.Handle, PAnsiChar(Un_R_file_Alex.J4_ALERT_CHOOSE_DATE_ALG),PAnsiChar(Un_R_file_Alex.J4_CAPTION_MSG), MB_OK + MB_ICONWARNING);
                                DateEditNewNumAlg.SetFocus;
                                exit;
                        end
                end
                else
                begin
                        SQL.Add(' USE_NEW_ALG_FOR_NUM_AO=0'+ ', ');
                        SQL.Add(' DATE_NEW_ALG_FOR_NUM_AO=null' + ', ');
                end;


                if(String(cxCheckBoxShowNeosnProv.EditValue)<>'')then
                        SQL.Add(' SHOW_NEOSNOV_PROV='+      String(cxCheckBoxShowNeosnProv.EditValue)+', '            );

                if(String(cxCheckBoxDelBuf.EditValue)<>'')then
                        SQL.Add(' DEL_BUFFER='+      String(cxCheckBoxDelBuf.EditValue)+', '            );

                if(CheckBox_MO_PRINT_ONLY_VIKON.Checked = True) then
                        SQL.Add(' J4_MO_PRINT_ONLY_VIKON=1,')
                else
                        SQL.Add(' J4_MO_PRINT_ONLY_VIKON=0,');

                if(CheckBox_IS_SELECT_TYPE_VVOD_VEDOM.Checked = True) then
                        SQL.Add(' J4_IS_SELECT_TYPE_VVOD_VEDOM=1,')
                else
                        SQL.Add(' J4_IS_SELECT_TYPE_VVOD_VEDOM=0,');

                if(CheckBox_J4_IS_PRINT_NAKAZ_IN_VEDOM_AV_O.Checked = True) then
                        SQL.Add(' J4_IS_PRINT_NAKAZ_IN_VEDOM_AV_O=1,')
                else
                        SQL.Add(' J4_IS_PRINT_NAKAZ_IN_VEDOM_AV_O=0,');

                if(CheckBox_IS_SELECT_TYPE_DOC.Checked = True) then
                        SQL.Add(' J4_IS_SELECT_TYPE_DOC_AV_O = 1,')
                else
                        SQL.Add(' J4_IS_SELECT_TYPE_DOC_AV_O = 0,');

                if(CheckBox_IS_VIEW_MO_ZVED_ZVIT.Checked = True) then
                        SQL.Add(' J4_IS_VIEW_MO_ZVED_ZVIT = 1,')
                else
                        SQL.Add(' J4_IS_VIEW_MO_ZVED_ZVIT = 0,');

                if(CheckBox_J4_IS_DEFAULT_COMMENT_VEDOMOST.Checked = True) then
                begin
                  SQL.Add(' J4_IS_DEFAULT_COMMENT_VEDOMOST = 1,');
                  SQL.Add(' J4_DEFAULT_COMMENT_VEDOMOST = '''+ Memo_J4_DEFAULT_COMMENT_VEDOMOST_VAL.text +''', '    );
                end
                else
                begin
                  SQL.Add(' J4_IS_DEFAULT_COMMENT_VEDOMOST = 0,');
                end;

                if(id_man_check>0)then
                        SQL.Add('ID_MEN_CHECK='+  IntToStr(id_man_check)+', '                );
                if(id_man_gl_bug>0)then
                        SQL.Add('ID_MEN_GL_BUHG='+  IntToStr(id_man_gl_bug)+', '                );
                if(id_group>0)then
                        SQL.Add('ID_GROUP='+  IntToStr(id_group)+', '                );
                if(id_group_add_pr>0)then
                        SQL.Add('ID_GROUP_ADD_PR='+  IntToStr(id_group_add_pr)+', '                );
                if(id_group_add_ras>0)then
                        SQL.Add('ID_GROUP_ADD_RAS='+  IntToStr(id_group_add_ras)                );

                {Подрихтовываем запрос--удаляем запятую вконце,если она там есть}
                s:=trim(SQL.Strings[SQL.Count-1]);

                if(s[length(s)]=',')then
                begin
                  s[length(s)]:=' ';
                  SQL.Delete(SQL.Count-1);
                  SQL.Add(s);
                end;

                {Подрихтовываем запрос--добавляем  во 2-й сироке set}
                s:=SQL.Strings[1];
                SQL.Delete(1);
                SQL.Insert(1,'set '+s);
        end;//with

        //ShowMessage(String(cxDateEditDateNewAlg.EditValue));
        if (cxCheckBoxNewAlg.Checked) and (String(cxDateEditDateNewAlg.EditValue)<>'') or (not cxCheckBoxNewAlg.Checked) and (String(cxDateEditDateNewAlg.EditValue)='') then
        begin
                try
                        pFIBTransactionWrite.StartTransaction;
                        pFIBQueryInsert.Prepare;
                        pFIBQueryInsert.ExecQuery;
                        pFIBTransactionWrite.Commit;
                    //    MessageBox(self.Handle, PAnsiChar(Un_R_file_Alex.J4_NASTROENO),PAnsiChar(Un_R_file_Alex.J4_CAPTION_MSG), MB_OK + MB_ICONASTERISK);
                except
                        pFIBTransactionWrite.Rollback;
                        MessageBox(self.Handle, PAnsiChar(Un_R_file_Alex.J4_ALERT_TABLE_EMPTY),PAnsiChar(Un_R_file_Alex.J4_CAPTION_MSG), MB_OK + MB_ICONWARNING);
                end;//except
        end;
        if (CheckBoxNewNumAlg.Checked) and (String(DateEditNewNumAlg.EditValue)<>'') or (not CheckBoxNewNumAlg.Checked) and (String(DateEditNewNumAlg.EditValue)='') then
        begin
                try
                        pFIBTransactionWrite.StartTransaction;
                        pFIBQueryInsert.Prepare;
                        pFIBQueryInsert.ExecQuery;
                        pFIBTransactionWrite.Commit;
                        MessageBox(self.Handle, PAnsiChar(Un_R_file_Alex.J4_NASTROENO),PAnsiChar(Un_R_file_Alex.J4_CAPTION_MSG), MB_OK + MB_ICONASTERISK);
                except
                        pFIBTransactionWrite.Rollback;
                        MessageBox(self.Handle, PAnsiChar(Un_R_file_Alex.J4_ALERT_TABLE_EMPTY),PAnsiChar(Un_R_file_Alex.J4_CAPTION_MSG), MB_OK + MB_ICONWARNING);
                end;//except
        end;

end;

procedure TfmJNastroyka.ButtonEditFioCheckPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    res : Variant;
begin
    res := Un_lo_file_Alex.MY_GetManEx(self, pFIBDatabase1.Handle, false, false, id_man_check);
    if VarArrayDimCount(res) > 0 then
    begin
        if (res[0]<>null) and (res[1]<>null) then
        begin
            if id_man_check <> res[0] then
            begin
                id_man_check := res[0];
                ButtonEditFioCheck.Text := res[1];
            end;
        end;
    end;
end;

procedure TfmJNastroyka.ButtonEditGlBuhgPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    res : Variant;
begin
    res := Un_lo_file_Alex.MY_GetManEx(self, pFIBDatabase1.Handle, false, false, id_man_gl_bug);
    if VarArrayDimCount(res) > 0 then
    begin
        if (res[0]<>null) and (res[1]<>null) then
        begin
            if id_man_gl_bug <> res[0] then
            begin
                id_man_gl_bug := res[0];
                ButtonEditGlBuhg.Text := res[1];
            end;
        end;
    end;
end;

procedure TfmJNastroyka.CheckBoxNewNumAlgPropertiesChange(Sender: TObject);
begin
        if CheckBoxNewNumAlg.Checked then
                DateEditNewNumAlg.Enabled := true
        else
        begin
                DateEditNewNumAlg.Enabled := false;
                DateEditNewNumAlg.EditValue := '';
        end;
end;

procedure TfmJNastroyka.CheckBox_J4_IS_DEFAULT_COMMENT_VEDOMOSTClick(
  Sender: TObject);
begin
  Memo_J4_DEFAULT_COMMENT_VEDOMOST_VAL.Enabled := CheckBox_J4_IS_DEFAULT_COMMENT_VEDOMOST.Checked;
end;

end.
