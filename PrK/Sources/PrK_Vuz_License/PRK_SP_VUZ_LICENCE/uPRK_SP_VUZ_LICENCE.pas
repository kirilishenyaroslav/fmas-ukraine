unit uPRK_SP_VUZ_LICENCE;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uKlassVuzLicense, cxStyles, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, cxEdit, DB, cxDBData, FIBDatabase, pFIBDatabase,
  FIBDataSet, pFIBDataSet, FIBQuery, pFIBQuery, pFIBStoredProc, Placemnt,
  dxBar, dxBarExtItems, ActnList, ImgList, dxStatusBar, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid;

type
  TFormPRK_SP_VUZ_LICENCE = class(TFormKlassVuzLicense)
    colSHIFR: TcxGridDBColumn;
    colSHORT_NAME_KATEGORY: TcxGridDBColumn;
    colLICENCE_VALUE: TcxGridDBColumn;
    colLICENCE_DATE_END: TcxGridDBColumn;
    colSPEC: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure ActionADDExecute(Sender: TObject);
    procedure ActionChangeExecute(Sender: TObject);
    procedure ActionViewExecute(Sender: TObject);
    procedure ActionPrintExecute(Sender: TObject);
  private
  public
    procedure InicCaption;override;
    { Public declarations }
  end;

var
  FormPRK_SP_VUZ_LICENCE: TFormPRK_SP_VUZ_LICENCE;

implementation
uses uConstants,uPRK_SP_VUZ_LICENCE_Edit,AArray,uPrK_Loader;
{$R *.dfm}

procedure TFormPRK_SP_VUZ_LICENCE.FormCreate(Sender: TObject);
begin
  inherited;
{ID_NAME должен стоять первым так как в SelectSQLText может делаться CloseOpen}
  ID_NAME              :='ID_SP_VUZ_LICENCE';
  SelectSQLText        :='Select * from PRK_SP_VUZ_LICENCE_SELECT';
  StoredProcAddName    :='PRK_SP_VUZ_LICENCE_ADD';
  StoredProcChangeName :='PRK_SP_VUZ_LICENCE_CHANGE';
  StoredProcDelName    :='PRK_SP_VUZ_LICENCE_DEL';

  InicFormCaption      :=nFormPRK_SP_VUZ_LICENCE_Caption[IndLangVL];

  dxBarLargeButtonPrint.Visible:=ivAlways;
  ActionPrint.Enabled          :=true;
  ActionPrint.Visible          :=true;
  //CheckAccessAdd    :='';
  //CheckAccessChange :='';
  //CheckAccessDel    :='';
end;

procedure TFormPRK_SP_VUZ_LICENCE.InicCaption;
begin
  inherited;
  colSHIFR.Caption               :=ncolSHIFR[IndLangVL];
  colSPEC.Caption                :=ncolNAME_SPEC[IndLangVL];
  colSHORT_NAME_KATEGORY.Caption :=ncolSHORT_NAME_KATEGORY[IndLangVL];
  colLICENCE_VALUE.Caption       :=ncolLICENCE_VALUE[IndLangVL];
  colLICENCE_DATE_END.Caption    :=ncolLICENCE_DATE_END[IndLangVL];
end;

procedure TFormPRK_SP_VUZ_LICENCE.ActionADDExecute(Sender: TObject);
var
   DataVLAdd :TAArray;
   T:TFormPRK_SP_VUZ_LICENCE_Edit;
   TryAgain :boolean;
begin
   TryAgain:=false;
   DataVLAdd :=TAArray.Create;
   DataVLAdd['SHIFR'].asString               :='';
   DataVLAdd['SHORT_NAME_KATEGORY'].AsString :='';
   DataVLAdd['LICENCE_VALUE'].AsInteger      :=0;
   DataVLAdd['LICENCE_DATE_END'].AsVariant   :=Date;


   if DataSetPrKVuzLicense.FieldValues[ID_NAME]<>Null
      then DataVLAdd['ID'].AsInt64:=StrToInt64(DataSetPrKVuzLicense.FieldValues[ID_NAME]);

   T := TFormPRK_SP_VUZ_LICENCE_Edit.Create(self,DataVLAdd);

   T.cxLabelFormCaption.Caption :=nFormKlassSpravEdit_Add[IndLangVL];

   if T.ShowModal=MrOk then
    begin
       StoredProcPrKVuzLicense.Transaction.StartTransaction;
       StoredProcPrKVuzLicense.StoredProcName:=StoredProcAddName;
       StoredProcPrKVuzLicense.Prepare;
       StoredProcPrKVuzLicense.ParamByName('ID_SP_MIN_PERELIK_SHIFR').AsInt64   :=DataVLAdd['ID_SP_MIN_PERELIK_SHIFR'].AsInt64;
       StoredProcPrKVuzLicense.ParamByName('ID_SP_FORM_OBUCH_KATEGORY').AsInt64 :=DataVLAdd['ID_SP_FORM_OBUCH_KATEGORY'].AsInt64;
       StoredProcPrKVuzLicense.ParamByName('LICENCE_VALUE').AsInteger           :=DataVLAdd['LICENCE_VALUE'].AsInteger;
       StoredProcPrKVuzLicense.ParamByName('LICENCE_DATE_END').AsDate           :=DataVLAdd['LICENCE_DATE_END'].AsVariant;
       try
          StoredProcPrKVuzLicense.ExecProc;
          StoredProcPrKVuzLicense.Transaction.commit;
          DataVLAdd['ID'].AsInt64:=StoredProcPrKVuzLicense.FieldByName('ID_OUT').AsInt64;
       except on e: Exception do
          begin
             MessageBox(Handle,Pchar(nMsgErrorTransaction[IndLangVL]+chr(13)+
                        nMsgTryAgain[IndLangVL]+nMsgOr[IndLangVL]+nMsgToAdmin[IndLangVL]+chr(13)+
                        e.Message),Pchar(nMsgBoxTitle[IndLangVL]),MB_OK or MB_ICONWARNING);
             StoredProcPrKVuzLicense.Transaction.Rollback;
             TryAgain:=true;
          end;
       end;
    end;
   T.Free;
   T:=nil;
   Obnovit(DataVLAdd['ID'].AsInt64);
   DataVLAdd.Free;
   DataVLAdd:=Nil;

   if TryAgain=true
      then ActionADDExecute(Sender);
end;

procedure TFormPRK_SP_VUZ_LICENCE.ActionChangeExecute(Sender: TObject);
var
   DataVLChange :TAArray;
   T:TFormPRK_SP_VUZ_LICENCE_Edit;
   TryAgain :boolean;
begin
   TryAgain:=false;
   if DataSetPrKVuzLicense.FieldValues[ID_NAME]<>Null then
    begin
       DataVLChange :=TAArray.Create;
       DataVLChange['ID'].AsInt64                        := DataSetPrKVuzLicense.FieldValues[ID_NAME];
       DataVLChange['ID_SP_MIN_PERELIK_SHIFR'].AsInt64   := DataSetPrKVuzLicense.FieldValues['ID_SP_MIN_PERELIK_SHIFR'];
       DataVLChange['SHIFR'].asString                    := DataSetPrKVuzLicense.FieldValues['SHIFR'];
       DataVLChange['ID_SP_FORM_OBUCH_KATEGORY'].AsInt64 := DataSetPrKVuzLicense.FieldValues['ID_SP_FORM_OBUCH_KATEGORY'];
       DataVLChange['SHORT_NAME_KATEGORY'].AsString      := DataSetPrKVuzLicense.FieldValues['SHORT_NAME_KATEGORY'];
       DataVLChange['LICENCE_VALUE'].AsInteger           := DataSetPrKVuzLicense.FieldValues['LICENCE_VALUE'];
       DataVLChange['LICENCE_DATE_END'].AsVariant        := DataSetPrKVuzLicense.FieldValues['LICENCE_DATE_END'];

       T:=TFormPRK_SP_VUZ_LICENCE_Edit.Create(self,DataVLChange);

       T.cxLabelFormCaption.Caption :=nFormKlassSpravEdit_Change[IndLangVL];

       if T.ShowModal=MrOk then
        begin
           StoredProcPrKVuzLicense.Transaction.StartTransaction;
           StoredProcPrKVuzLicense.StoredProcName:=StoredProcChangeName;
           StoredProcPrKVuzLicense.Prepare;
           StoredProcPrKVuzLicense.ParamByName(ID_NAME).AsInt64                    :=DataVLChange['ID'].AsInt64;
           StoredProcPrKVuzLicense.ParamByName('ID_SP_MIN_PERELIK_SHIFR').AsInt64  :=DataVLChange['ID_SP_MIN_PERELIK_SHIFR'].AsInt64;
           StoredProcPrKVuzLicense.ParamByName('ID_SP_FORM_OBUCH_KATEGORY').AsInt64:=DataVLChange['ID_SP_FORM_OBUCH_KATEGORY'].AsInt64;
           StoredProcPrKVuzLicense.ParamByName('LICENCE_VALUE').AsInteger          :=DataVLChange['LICENCE_VALUE'].AsInteger;
           StoredProcPrKVuzLicense.ParamByName('LICENCE_DATE_END').AsDate          :=DataVLChange['LICENCE_DATE_END'].AsVariant;

           try
              StoredProcPrKVuzLicense.ExecProc;
              StoredProcPrKVuzLicense.Transaction.Commit;
           except on e: Exception do
              begin
                 MessageBox(Handle,Pchar(nMsgErrorTransaction[IndLangVL]+chr(13)+
                        nMsgTryAgain[IndLangVL]+nMsgOr[IndLangVL]+nMsgToAdmin[IndLangVL]+chr(13)+
                        e.Message),Pchar(nMsgBoxTitle[IndLangVL]),MB_OK or MB_ICONWARNING);
                 StoredProcPrKVuzLicense.Transaction.Rollback;
                 TryAgain:=true;
              end;
           end;
        end;

       T.Free;
       T:=nil;
       Obnovit(DataVLChange['ID'].AsInt64);
       DataVLChange.Free;
       DataVLChange:=nil;
   end;
   if TryAgain=true
    then ActionChangeExecute(sender);
end;

procedure TFormPRK_SP_VUZ_LICENCE.ActionViewExecute(Sender: TObject);
var
   DataVLView :TAArray;
   T:TFormPRK_SP_VUZ_LICENCE_Edit;
begin
   if DataSetPrKVuzLicense.FieldValues[ID_NAME]<>Null then
    begin
       DataVLView :=TAArray.Create;
       DataVLView['ID'].AsInt64                        := DataSetPrKVuzLicense.FieldValues[ID_NAME];
       DataVLView['SHIFR'].asString                    := DataSetPrKVuzLicense.FieldValues['SHIFR'];
       DataVLView['SHORT_NAME_KATEGORY'].AsString      := DataSetPrKVuzLicense.FieldValues['SHORT_NAME_KATEGORY'];
       DataVLView['LICENCE_VALUE'].AsInteger           := DataSetPrKVuzLicense.FieldValues['LICENCE_VALUE'];
       DataVLView['LICENCE_DATE_END'].AsVariant        := DataSetPrKVuzLicense.FieldValues['LICENCE_DATE_END'];


       T:=TFormPRK_SP_VUZ_LICENCE_Edit.Create(self,DataVLView);

       T.cxLabelFormCaption.Caption  :=nFormKlassSpravEdit_View[IndLangVL];
       T.cxButtonEditShifr.Properties.ReadOnly            :=true;
       T.cxButtonEditShifr.Properties.Buttons[0].Visible          :=false;
       T.cxButtonEditNameObuchKateg.Properties.ReadOnly   :=true;
       T.cxButtonEditNameObuchKateg.Properties.Buttons[0].Visible :=false;
       T.cxTextEditLicenseValue.Properties.ReadOnly       :=true;
       T.cxDateEditLicenseDateEnd.Properties.ReadOnly     :=true;
       T.cxButtonEditShifr.Style.Color                    :=TextViewColor;
       T.cxButtonEditNameObuchKateg.Style.Color           :=TextViewColor;
       T.cxTextEditLicenseValue.Style.Color               :=TextViewColor;
       T.cxDateEditLicenseDateEnd.Style.Color             :=TextViewColor;
       T.ShowModal;
       T.Free;
       T:=nil;
       DataVLView.Free;
       DataVLView:=nil;
    end;
end;

procedure TFormPRK_SP_VUZ_LICENCE.ActionPrintExecute(Sender: TObject);
var
  InputParam :TAArray;
begin
  InputParam :=TAArray.Create;
    InputParam['Name_Bpl'].AsString                     := 'PrK_rptLoader.bpl';
    InputParam['Input']['aDBHANDLE'].AsInteger          := Integer(DataBasePrKVuzLicense.Handle);
    InputParam['Input']['aNameReport'].AsString         := 'VUZ_LICENCE';
  uPrK_Loader.ShowAllPrkBpl(self,InputParam);
end;

end.
