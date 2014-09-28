unit uo_sp_type_cikl_pidg_main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxBar, dxBarExtItems, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxContainer,
  ActnList, ImgList,  FIBDataSet, pFIBDataSet, FIBQuery,
  pFIBQuery, pFIBStoredProc, FIBDatabase, pFIBDatabase, dxStatusBar,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView, cxGrid, StdCtrls,
  Buttons, ExtCtrls, AArray, ibase, ib_externals, frxExportPDF,
  frxExportImage, frxExportXML, frxExportHTML, frxExportXLS, frxExportTXT,
  frxClass, frxExportRTF, frxDBSet;

type
  Tfm_uo_sp_type_cikl_pidg_main = class(TForm)
    cxGrid_uo__sp_type: TcxGrid;
    cxGrid_uo__sp_typeDBTableView1: TcxGridDBTableView;
    cxGrid_uo__sp_typeLevel1: TcxGridLevel;
    dxStatusBarSP: TdxStatusBar;
    StyleRepository_sp_type: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    cxStyle6: TcxStyle;
    cxStyleHeader: TcxStyle;
    cxStyle8: TcxStyle;
    cxStyle9: TcxStyle;
    cxStyleInactive: TcxStyle;
    cxStyle11: TcxStyle;
    cxStyleSkyBlue: TcxStyle;
    cxStyleBackGround_Content: TcxStyle;
    cxStyleSelection: TcxStyle;
    DataBase_uo__sp_type: TpFIBDatabase;
    TransactionRead_uo__sp_type: TpFIBTransaction;
    TransactionWrite_uo_sp_type: TpFIBTransaction;
    StoredProc_uo_sp_type: TpFIBStoredProc;
    DataSet_uo__sp_type: TpFIBDataSet;
    DataSource_uo__sp_type: TDataSource;
    ImageList_sp_type: TImageList;
    cxEditStyleController_uo__sp_type: TcxEditStyleController;
    cxGrid_uo__sp_typeDBTableView1NAME: TcxGridDBColumn;
    cxGrid_uo__sp_typeDBTableView1SHORT_NAME: TcxGridDBColumn;
    cxGrid_uo__sp_typeDBTableView1KOD: TcxGridDBColumn;
    cxGrid_uo__sp_typeDBTableView1NPP: TcxGridDBColumn;
    ActionList_uo__sp_type: TActionList;
    ActionADD: TAction;
    ActionChange: TAction;
    ActionDEL: TAction;
    ActionView: TAction;
    ActionObnov: TAction;
    ActionVibrat: TAction;
    ActionOtmena: TAction;
    ActionPrint: TAction;
    DataSource_prov_kod: TDataSource;
    DataSource_prov_npp: TDataSource;
    frxDBDataset1: TfrxDBDataset;
    frxRTFExport1: TfrxRTFExport;
    frxTXTExport1: TfrxTXTExport;
    frxXLSExport1: TfrxXLSExport;
    frxBMPExport1: TfrxBMPExport;
    frxJPEGExport1: TfrxJPEGExport;
    frxHTMLExport1: TfrxHTMLExport;
    frxXMLExport1: TfrxXMLExport;
    frxTIFFExport1: TfrxTIFFExport;
    frxPDFExport1: TfrxPDFExport;
    dxBarManager_sp_type: TdxBarManager;
    dxBarLargeButtonAdd: TdxBarLargeButton;
    dxBarLargeButtonChange: TdxBarLargeButton;
    dxBarLargeButtonVibrat: TdxBarLargeButton;
    dxBarLargeButtonOtmena: TdxBarLargeButton;
    dxBarLargeButtonObnov: TdxBarLargeButton;
    dxBarLargeButtonView: TdxBarLargeButton;
    dxBarLargeButtonDel: TdxBarLargeButton;
    dxBarLargeButtonPrint: TdxBarLargeButton;
    DataSet_uo__sp_typeID_SP_TYPE_CIKL_PIDG: TFIBBCDField;
    DataSet_uo__sp_typeNAME: TFIBStringField;
    DataSet_uo__sp_typeSHORT_NAME: TFIBStringField;
    DataSet_uo__sp_typeKOD: TFIBIntegerField;
    DataSet_uo__sp_typeNPP: TFIBIntegerField;
    frxReport1: TfrxReport;
    DataSet_prov_kod: TpFIBDataSet;
    DataSet_prov_npp: TpFIBDataSet;
    procedure ActionADDExecute(Sender: TObject);
    procedure ActionObnovExecute(Sender: TObject);
    procedure ActionChangeExecute(Sender: TObject);
    procedure ActionDELExecute(Sender: TObject);
    procedure ActionViewExecute(Sender: TObject);
    procedure ActionOtmenaExecute(Sender: TObject);
    procedure ActionVibratExecute(Sender: TObject);
    procedure cxGrid_uo__sp_typeDBTableView1DblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure LoadCaption;
    procedure ActionPrintExecute(Sender: TObject);
  private
    { Private declarations }
    DBHANDLE                :TISC_DB_HANDLE;
    ResultArray             :TAArray;

    kod_get: Integer;
    good: Integer;
    npp_get: Integer;
    goodn: Integer;
    PROCEDURE proverkakod(kod: integer);
    PROCEDURE proverkanpp(npp: integer);
  public
    { Public declarations }
    temp_kod: Integer;
    temp_npp: Integer;
    temp_name: String;
    temp_short_name: String;
    temp_SP_TYPE_DISC_LESSON: Int64;
    type_kod: String;
    type_npp: String;
    temp_type_npp: Integer;
    cap : Integer;

    ID_SP_TYPE_CIKL_PIDG : Int64;
    Name_SP_TYPE_DISC_LESSON: String;
    Short_Name_SP_TYPE_DISC_LESSON: String;
    Kod_SP_TYPE_DISC_LESSON: Integer;
    Npp_SP_TYPE_DISC_LESSON: Integer;
    constructor Create(aOwner: TComponent; aParam : TAArray); reintroduce; overload;

  end;
procedure ShowAllUoBpl (aOwner: TComponent; aParam : TAArray); stdcall;
  exports   ShowAllUoBpl;

implementation

uses uo_sp_type_cikl_pidg_add;

{$R *.dfm}

procedure ShowAllUoBpl(aOwner: TComponent; aParam : TAArray);
var
   T : Tfm_uo_sp_type_cikl_pidg_main;
begin
   T := Tfm_uo_sp_type_cikl_pidg_main.Create(aOwner, aParam);

   T.FormStyle := aParam['Input']['aFrmStyle'].AsVariant;
   case T.FormStyle of
      fsNormal: begin
                   T.ShowModal;
                   T.ActionVibrat.Enabled:=true;
                   T.dxBarLargeButtonVibrat.Visible := ivAlways;
                end;
      fsMDIChild: begin
                   T.ActionVibrat.Enabled:=false;
                   T.dxBarLargeButtonVibrat.Visible := ivNever;
                end;
      else
         T.Free;
   end;
end;

constructor Tfm_uo_sp_type_cikl_pidg_main.Create(aOwner: TComponent;
  aParam: TAArray);
begin
    if Assigned(PVoid(aParam['Input']['aDBHANDLE'])) then
    begin
        DBHANDLE      := PVoid(aParam['Input']['aDBHANDLE'].asInteger);

        inherited Create(aOwner);
        ResultArray   := aParam;
        DataBase_uo__sp_type.Close;
        DataBase_uo__sp_type.Handle := DBHANDLE;
        TransactionRead_uo__sp_type.DefaultDatabase := DataBase_uo__sp_type;

        DataSet_uo__sp_type.Database := DataBase_uo__sp_type;
        DataSet_uo__sp_type.Transaction := TransactionRead_uo__sp_type;

        DataSet_prov_kod.Database := DataBase_uo__sp_type;
        DataSet_prov_kod.Transaction := TransactionRead_uo__sp_type;

        DataSet_prov_npp.Database := DataBase_uo__sp_type;
        DataSet_prov_npp.Transaction := TransactionRead_uo__sp_type;

        TransactionRead_uo__sp_type.StartTransaction;
        
        LoadCaption;
        DataSet_uo__sp_type.Close;
        DataSet_uo__sp_type.SQLs.SelectSQL.Text := 'SELECT ID_SP_TYPE_CIKL_PIDG, NAME, SHORT_NAME, KOD, NPP FROM UO_SP_TYPE_CIKL_PIDG';
        DataSet_uo__sp_type.Open;
    end
    else ShowMessage('Ошибка Handl`a Базы');
end;

procedure Tfm_uo_sp_type_cikl_pidg_main.proverkakod(kod: integer);
begin
    DataSet_prov_kod.Close;
    DataSet_prov_kod.Sqls.SelectSql.Text := 'select max(kod) as KOD from UO_SP_TYPE_CIKL_PIDG';
    DataSet_prov_kod.Open;
    temp_kod := DataSet_prov_kod.fbn('KOD').AsInteger + 1;
    good        := 1;
    DataSet_prov_kod.Close;
{    if DataSet_prov_kod.IsEmpty then
    begin
        temp_kod    := kod;
        good        := 1;
    end
    else
    begin
        kod_get                                   := 1;
        DataSet_prov_kod.Active                   := false;
        DataSet_prov_kod.ParamByName('KOD').Value := kod_get;
        DataSet_prov_kod.Active                   := true;
    while not(DataSet_prov_kod.IsEmpty) do
    begin
        kod_get                                   := kod_get + 1;
        DataSet_prov_kod.Active                   := false;
        DataSet_prov_kod.ParamByName('KOD').Value := kod_get;
        DataSet_prov_kod.Active                   := true;
    end;
    //ShowMessage('такий код вже існує спробуйте Код= '+IntToStr(kod_get));
    temp_kod := kod_get;
    good     := 0;
end;}
end;

PROCEDURE Tfm_uo_sp_type_cikl_pidg_main.proverkanpp(npp: integer);
begin
    DataSet_prov_npp.Close;
    DataSet_prov_npp.Sqls.SelectSql.Text := 'select max(NPP) as NPP from UO_SP_TYPE_CIKL_PIDG';
    DataSet_prov_npp.Open;
    temp_npp := DataSet_prov_npp.fbn('NPP').AsInteger + 1;
    goodn    := 1;
    DataSet_prov_npp.Close;
{    if DataSet_prov_npp.IsEmpty then
    begin
        temp_npp := npp;
        goodn    := 1;
    end
    else
    begin
        npp_get                                     := 1;
        DataSet_prov_npp.Active                     := false;
        DataSet_prov_npp.ParamByName('NPP').Value   := npp_get;
        DataSet_prov_npp.Active                     := true;
        while not(DataSet_prov_npp.IsEmpty) do
        begin
            npp_get                                     := npp_get+1;
            DataSet_prov_npp.Active                     := false;
            DataSet_prov_npp.ParamByName('NPP').Value   := npp_get;
            DataSet_prov_npp.Active                     := true;
        end;
        //ShowMessage('такий номер вже існує спробуйте номер= '+IntToStr(npp_get));
        temp_npp                                        := npp_get;
        goodn                                           := 0;
    end;}
end;

procedure Tfm_uo_sp_type_cikl_pidg_main.ActionADDExecute(Sender: TObject);
var
   T : Tfmuo_sp_type_cikl_pidg_add;
   TryAgain : boolean;
begin
   cap      := 0;
   TryAgain := false;
  { DataSPAdd :=TAArray.Create;
   DataSPAdd['FIO'].AsString                      :='';
   DataSPAdd['SHORT_NAME_DOLGNOST_PK'].AsString   :='';
   DataSPAdd['PRIM'].AsString                     :='';  }

  { if DataSetPrKSostPK.FieldValues[ID_NAME]<>Null
      then DataSPAdd['ID'].AsInt64:=StrToInt64(DataSetPrKSostPK.FieldValues[ID_NAME]);
    }
   T := Tfmuo_sp_type_cikl_pidg_add.Create(self);
   proverkakod(1);
   proverkanpp(1);
   t.cxSpinEditKod.Value:=temp_kod;
   t.cxSpinEditNPP.Value:=temp_npp;
   if(HelpContext=1)then
   begin
       t.cxTextEditName.Text        := temp_name;
       t.cxTextEditShortName.Text   := temp_short_name;
       t.cxSpinEditKod.Value        := temp_kod;
       t.cxSpinEditNPP.Value        := temp_npp;
   end;

   if T.ShowModal=MrOk then
   begin
       proverkakod(t.cxSpinEditKod.Value);
       proverkanpp(t.cxSpinEditNPP.Value);
       if ((good=1)and(goodn=1))then
       begin
       StoredProc_uo_sp_type.Transaction.StartTransaction;
       StoredProc_uo_sp_type.StoredProcName := 'UO_SP_TYPE_CIKL_PIDG_ADD';
       StoredProc_uo_sp_type.Prepare;
       StoredProc_uo_sp_type.ParamByName('NAME').AsString         := T.cxTextEditName.Text;
       StoredProc_uo_sp_type.ParamByName('SHORT_NAME').AsString   := T.cxTextEditShortName.Text;
       StoredProc_uo_sp_type.ParamByName('KOD').Value             := T.cxSpinEditKod.Value;
       StoredProc_uo_sp_type.ParamByName('NPP').Value             := T.cxSpinEditNPP.Value;
       temp_type_npp                                              := T.cxSpinEditNPP.Value;
       try
           StoredProc_uo_sp_type.ExecProc;
           StoredProc_uo_sp_type.Transaction.commit;
       except on e: Exception do
          begin
             {MessageBox(Handle,Pchar(nMsgErrorTransaction[IndLangSP]+chr(13)+
                        nMsgTryAgain[IndLangSP]+nMsgOr[IndLangSP]+nMsgToAdmin[IndLangSP]+chr(13)+
                        e.Message),Pchar(nMsgBoxTitle[IndLangSP]),MB_OK or MB_ICONWARNING);
             }
             ShowMessage('Неможливо додати тип!'+E.Message);
             StoredProc_uo_sp_type.Transaction.Rollback;
             TryAgain := true;
          end;
       end;
       end
       else
       begin
            MessageDlg('такий код або номер вже існують.'#13'Сістема вже підставила потрібні!', mtInformation, mbOKCancel,0);
            TryAgain    := true;
            HelpContext := 1;
            //temp_kod:=t.cxSpinEditKod.Value;
            //temp_npp:=t.cxSpinEditNPP.Value;
            temp_name   := T.cxTextEditName.Text;
            temp_short_name := T.cxTextEditShortName.Text;
            temp_SP_TYPE_DISC_LESSON := id_SP_TYPE_CIKL_PIDG;
       end;
          //DataSPAdd['ID'].AsInt64:=StoredProcPrKSostPK.FieldByName('ID_OUT').AsInt64;

    end;

   T.Free;
   //ActionObnovExecute(sender);
   if TryAgain = true
       then ActionADDExecute(sender)
   else
       HelpContext := 0;

    DataSet_uo__sp_type.Closeopen(false);
    DataSet_uo__sp_type.Locate('NPP',temp_type_npp,[]);
end;

procedure Tfm_uo_sp_type_cikl_pidg_main.ActionObnovExecute(Sender: TObject);
begin
    temp_SP_TYPE_DISC_LESSON   := DataSet_uo__sp_typeID_SP_TYPE_CIKL_PIDG.AsInt64;
    DataSet_uo__sp_type.Active := false;
    DataSet_uo__sp_type.Active := true;
    DataSet_uo__sp_type.Locate('ID_SP_TYPE_CIKL_PIDG', temp_SP_TYPE_DISC_LESSON, []);
end;

procedure Tfm_uo_sp_type_cikl_pidg_main.ActionChangeExecute(Sender: TObject);
var
   T : Tfmuo_sp_type_cikl_pidg_add;
   TryAgain : boolean;
begin
    cap                      := 1;
    temp_SP_TYPE_DISC_LESSON := DataSet_uo__sp_typeID_SP_TYPE_CIKL_PIDG.AsInt64;

    if DataSet_uo__sp_type.IsEmpty then exit;
    good  := 1;
    goodn := 1;
    TryAgain:=false;

    T := Tfmuo_sp_type_cikl_pidg_add.Create(self);
    if(HelpContext=1)then
    begin
        t.cxTextEditName.Text        := temp_name;
        t.cxTextEditShortName.Text   := temp_short_name;
        t.cxSpinEditKod.Value        := temp_kod;
        t.cxSpinEditNPP.Value        := temp_npp;
    end
    ELSE
    begin
        T.cxTextEditName.Text      := DataSet_uo__sp_typeNAME.Value;
        T.cxTextEditShortName.Text := DataSet_uo__sp_typeSHORT_NAME.Value;
        T.cxSpinEditKod.Value      := DataSet_uo__sp_typeKOD.Value;
        T.cxSpinEditNPP.Value      := DataSet_uo__sp_typeNPP.Value;
        type_kod                   := DataSet_uo__sp_typeKOD.AsString;
        type_npp                   := DataSet_uo__sp_typeNPP.AsString;
    end;

       if T.ShowModal=MrOk then
       begin
          if(type_kod<>inttostr(t.cxSpinEditKod.Value))then
               proverkakod(t.cxSpinEditKod.Value);
          if(type_npp<>inttostr(t.cxSpinEditNPP.Value))then
                proverkanpp(t.cxSpinEditNPP.Value);

       if ((good=1)and(goodn=1))then
       begin
           StoredProc_uo_sp_type.Transaction.StartTransaction;
           StoredProc_uo_sp_type.StoredProcName := 'UO_SP_TYPE_CIKL_PIDG_CHANGE';
           StoredProc_uo_sp_type.Prepare;
           StoredProc_uo_sp_type.ParamByName('ID').AsInt64                      := DataSet_uo__sp_typeID_SP_TYPE_CIKL_PIDG.AsInt64;
           StoredProc_uo_sp_type.ParamByName('NAME').AsString                   := T.cxTextEditName.Text;
           StoredProc_uo_sp_type.ParamByName('SHORT_NAME').AsString             := T.cxTextEditShortName.Text;
           StoredProc_uo_sp_type.ParamByName('KOD').Value                       := T.cxSpinEditKod.Value;
           StoredProc_uo_sp_type.ParamByName('NPP').Value                       := T.cxSpinEditNPP.Value;
           try
               StoredProc_uo_sp_type.ExecProc;
               StoredProc_uo_sp_type.Transaction.Commit;
           except on e: Exception do
              begin
                 {MessageBox(Handle,Pchar(nMsgErrorTransaction[IndLangSP]+chr(13)+
                        nMsgTryAgain[IndLangSP]+nMsgOr[IndLangSP]+nMsgToAdmin[IndLangSP]+chr(13)+
                        e.Message),Pchar(nMsgBoxTitle[IndLangSP]),MB_OK or MB_ICONWARNING);
                 }
                 ShowMessage('Неможливо добавити тип!'+E.Message);
                 StoredProc_uo_sp_type.Transaction.Rollback;
                 TryAgain := true;
              end;
           end;
        end
       else
       begin
            MessageDlg('такий код або номер вже існують.'#13'Сістема вже підставила потрібні!',mtInformation,mbOKCancel,0);
            TryAgain    := true;
            HelpContext := 1;
            //temp_kod:=t.cxSpinEditKod.Value;
            //
            temp_npp    := T.cxSpinEditNPP.Value;
            temp_name   := T.cxTextEditName.Text;
            temp_short_name := T.cxTextEditShortName.Text;
            temp_SP_TYPE_DISC_LESSON := ID_SP_TYPE_CIKL_PIDG;
       end;
        end;

       T.Free;
       //ActionObnovExecute(sender);
    if TryAgain=true
        then ActionChangeExecute(sender)
        else HelpContext:=0;
    DataSet_uo__sp_type.CloseOpen(false);
    DataSet_uo__sp_type.Locate('ID_SP_TYPE_CIKL_PIDG', temp_SP_TYPE_DISC_LESSON, []);
end;

procedure Tfm_uo_sp_type_cikl_pidg_main.ActionDELExecute(Sender: TObject);
begin
   if DataSet_uo__sp_type.IsEmpty then exit;
   if DataSet_uo__sp_typeID_SP_TYPE_CIKL_PIDG.AsString<>Null then
   begin
       if MessageDlg('Ви дійсно бажаете видалити цей запис', mtInformation, mbOKCancel, 0)=mrOK then
       begin
            StoredProc_uo_sp_type.Transaction.StartTransaction;
            StoredProc_uo_sp_type.StoredProcName := 'UO_SP_TYPE_CIKL_PIDG_DEL';
            StoredProc_uo_sp_type.Prepare;
            StoredProc_uo_sp_type.ParamByName('ID').AsInt64 := DataSet_uo__sp_typeID_SP_TYPE_CIKL_PIDG.AsInt64;
            try
                StoredProc_uo_sp_type.ExecProc;
                StoredProc_uo_sp_type.Transaction.Commit;
                cxGrid_uo__sp_typeDBTableView1.NavigatorButtons.Prior.Click;
            except on e :Exception do
               begin
                 {MessageBox(Handle,Pchar(nMsgErrorTransaction[IndLangSP]+chr(13)+
                        nMsgTryAgain[IndLangSP]+nMsgOr[IndLangSP]+nMsgToAdmin[IndLangSP]+chr(13)+
                        e.Message),Pchar(nMsgBoxTitle[IndLangSP]),MB_OK or MB_ICONWARNING);
                 }
                 ShowMessage('Неможливо видалити тип!'+E.Message);
                 StoredProc_uo_sp_type.Transaction.Rollback;
               end;
            end;
      end;
         ActionObnovExecute(sender);
   end;
end;

procedure Tfm_uo_sp_type_cikl_pidg_main.ActionViewExecute(Sender: TObject);
var
    T : Tfmuo_sp_type_cikl_pidg_add;
begin
    cap := 2;
    if DataSet_uo__sp_type.IsEmpty then exit;
    if DataSet_uo__sp_typeID_SP_TYPE_CIKL_PIDG.AsString<>Null then
    begin
        T                           := Tfmuo_sp_type_cikl_pidg_add.Create(self);
        T.cxTextEditName.Text       := DataSet_uo__sp_typeNAME.Value;
        T.cxTextEditShortName.Text  := DataSet_uo__sp_typeSHORT_NAME.Value;
        T.cxSpinEditKod.Value       := DataSet_uo__sp_typeKOD.Value;
        T.cxSpinEditNPP.Value       := DataSet_uo__sp_typeNPP.Value;

        T.cxTextEditName.Properties.ReadOnly        := true;
        T.cxTextEditShortName.Properties.ReadOnly   := true;
        T.cxSpinEditKod.Properties.ReadOnly         := true;
        T.cxSpinEditNPP.Properties.ReadOnly         := true;
        T.cxButtonOK.Visible                        := false;
        T.cxButtonCansel.Visible                    := false;
        T.ShowModal;
        T.Free;
    end;
end;

procedure Tfm_uo_sp_type_cikl_pidg_main.ActionOtmenaExecute(Sender: TObject);
begin
    close;
end;

procedure Tfm_uo_sp_type_cikl_pidg_main.ActionVibratExecute(Sender: TObject);
begin
    if not DataSet_uo__sp_type.IsEmpty then
    if DataSet_uo__sp_typeID_SP_TYPE_CIKL_PIDG.AsString<>NULL then
    begin
        if DataSet_uo__sp_typeID_SP_TYPE_CIKL_PIDG.AsString='-1' then exit;
        if FormStyle=fsNormal then
        begin
//            FillArrayFromDataSet(ResultArray['OutPut'], DataSet_uo__sp_type);
              ResultArray['OutPut']['ID_SP_TYPE_CIKL_PIDG'].AsInt64  := DataSet_uo__sp_typeID_SP_TYPE_CIKL_PIDG.AsInt64;
              ResultArray['OutPut']['NAME'].AsString                 := DataSet_uo__sp_typeNAME.AsString;
              ResultArray['OutPut']['SHORT_NAME'].AsString           := DataSet_uo__sp_typeSHORT_NAME.AsString;
              ResultArray['OutPut']['KOD'].AsInteger                 := DataSet_uo__sp_typeKOD.AsInteger;
              ResultArray['OutPut']['NPP'].AsInteger                 := DataSet_uo__sp_typeNPP.AsInteger;

              {             Name_SP_TYPE_DISC_LESSON:=fm_UO_SP_TYPE_DISC_LESSON.DataSet_uo__sp_typeNAME.Value;
              Short_Name_SP_TYPE_DISC_LESSON:=fm_UO_SP_TYPE_DISC_LESSON.DataSet_uo__sp_typeSHORT_NAME.Value;
              Kod_SP_TYPE_DISC_LESSON:=fm_UO_SP_TYPE_DISC_LESSON.DataSet_uo__sp_typeKOD.Value;
              Npp_SP_TYPE_DISC_LESSON:=fm_UO_SP_TYPE_DISC_LESSON.DataSet_uo__sp_typeNPP.Value;
              id_SP_TYPE_CIKL_PIDG := fm_UO_SP_TYPE_DISC_LESSON.DataSet_uo__sp_typeID_SP_TYPE_DISC_LESSON.AsInt64;
             }
            close;
        end
        else
            ModalResult:=mrOk;
    end;
end;

procedure Tfm_uo_sp_type_cikl_pidg_main.cxGrid_uo__sp_typeDBTableView1DblClick(
  Sender: TObject);
begin
    if ActionVibrat.Visible=true then
        ActionVibratExecute(SENDER);
end;

procedure Tfm_uo_sp_type_cikl_pidg_main.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    if FormStyle = fsMDIChild then
    begin
        ResultArray.Free;
        ResultArray := Nil;
        Action      := caFree;
    end;
end;

procedure Tfm_uo_sp_type_cikl_pidg_main.LoadCaption;
begin
    Caption                 := 'Довідник типів циклів підготовки';
    ActionADD.Caption       := 'Додати';
    ActionChange.Caption    := 'Змінити';
    ActionDEL.Caption       := 'Видалити';
    ActionView.Caption      := 'Показати';
    ActionObnov.Caption     := 'Оновити';
    ActionVibrat.Caption    := 'Вибрати';
    ActionOtmena.Caption    := 'Відміна';

    ActionADD.Hint          := 'Додати';
    ActionChange.Hint       := 'Змінити';
    ActionDEL.Hint          := 'Видалити';
    ActionView.Hint         := 'Показати';
    ActionObnov.Hint        := 'Оновити';
    ActionVibrat.Hint       := 'Вибрати';
    ActionOtmena.Hint       := 'Відміна';

    ActionPrint.Caption     := 'Друкувати';
    ActionPrint.Hint        := 'Друкувати';

    cxGrid_uo__sp_typeDBTableView1NAME.Caption       := 'Назва';
    cxGrid_uo__sp_typeDBTableView1SHORT_NAME.Caption := 'Коротка назва';
    cxGrid_uo__sp_typeDBTableView1KOD.Caption        := 'Код';
    cxGrid_uo__sp_typeDBTableView1NPP.Caption        := 'Номер';
    dxStatusBarSP.Panels[0].Text                     := 'Додати - Ins';
    dxStatusBarSP.Panels[1].Text                     := 'Змінити - F2';
    dxStatusBarSP.Panels[2].Text                     := 'Видалити - Del';
    dxStatusBarSP.Panels[3].Text                     := 'Оновити - F5';
    dxStatusBarSP.Panels[4].Text                     := 'Показати - F3';
    dxStatusBarSP.Panels[5].Text                     := 'Вибрати - Enter';
end;


procedure Tfm_uo_sp_type_cikl_pidg_main.ActionPrintExecute(Sender: TObject);
var
    Memo1, Memo6, Memo7, Memo9, Memo8: TfrxMemoView;
begin
    if DataSet_uo__sp_type.IsEmpty then exit;
    Memo1       := frxReport1.FindObject('Memo1') as TfrxMemoView;
    Memo6       := frxReport1.FindObject('Memo6') as TfrxMemoView;
    Memo7       := frxReport1.FindObject('Memo7') as TfrxMemoView;
    Memo9       := frxReport1.FindObject('Memo9') as TfrxMemoView;
    Memo8       := frxReport1.FindObject('Memo8') as TfrxMemoView;
    Memo1.Text  := 'Довідник типів циклів підготовки';
    Memo6.Text  := 'Назва';
    Memo7.Text  := 'Коротка назва';
    Memo8.Text  := 'Номер';
    Memo9.Text  := 'Код';
    frxReport1.ShowReport;
end;

end.
