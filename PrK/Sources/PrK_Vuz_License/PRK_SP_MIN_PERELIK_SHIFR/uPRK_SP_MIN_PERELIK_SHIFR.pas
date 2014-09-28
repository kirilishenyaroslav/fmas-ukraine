unit uPRK_SP_MIN_PERELIK_SHIFR;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uKlassVuzLicense, cxStyles, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, cxEdit, DB, cxDBData, FIBDatabase, pFIBDatabase,
  FIBDataSet, pFIBDataSet, FIBQuery, pFIBQuery, pFIBStoredProc, Placemnt,
  dxBar, dxBarExtItems, ActnList, ImgList, dxStatusBar, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxTextEdit;

type
  TFormPRK_SP_MIN_PERELIK_SHIFR = class(TFormKlassVuzLicense)
    colSHORT_NAME_SPEC: TcxGridDBColumn;
    colSHORT_NAME_STUD: TcxGridDBColumn;
    colSHIFR: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure ActionADDExecute(Sender: TObject);
    procedure ActionChangeExecute(Sender: TObject);
    procedure ActionViewExecute(Sender: TObject);
    procedure ActionPrintExecute(Sender: TObject);
  private
     procedure InicCaption;override;
  public
    { Public declarations }
  end;

var
  FormPRK_SP_MIN_PERELIK_SHIFR: TFormPRK_SP_MIN_PERELIK_SHIFR;

implementation
uses uConstants,uPrK_MIN_PER_SHIFR_Edit,AArray,uPrK_Loader;
{$R *.dfm}


procedure TFormPRK_SP_MIN_PERELIK_SHIFR.FormCreate(Sender: TObject);
begin
  inherited;
{ID_NAME должен стоять первым так как в SelectSQLText может делаться CloseOpen}
  ID_NAME              :='ID_SP_MIN_PERELIK_SHIFR';
  SelectSQLText        :='Select * from PRK_SP_MIN_PERELIK_SHIFR_SELECT';
  StoredProcAddName    :='PRK_SP_MIN_PERELIK_SHIFR_ADD';
  StoredProcChangeName :='PRK_SP_MIN_PERELIK_SHIFR_CHANGE';
  StoredProcDelName    :='PRK_SP_MIN_PERELIK_SHIFR_DEL';

  InicFormCaption      :=nFormPRK_SP_MIN_PERELIK_SHIFR_Caption[IndLangVL];

  dxBarLargeButtonPrint.Visible:=ivAlways;
  ActionPrint.Enabled          :=true;
  ActionPrint.Visible          :=true;
  //CheckAccessAdd    :='';
  //CheckAccessChange :='';
  //CheckAccessDel    :='';
  //CheckAccessPrint  :='';
end;

procedure TFormPRK_SP_MIN_PERELIK_SHIFR.InicCaption;
begin
  inherited;
  colSHORT_NAME_SPEC.Caption :=ncolNAME_SPEC[IndLangVL];
  colSHORT_NAME_STUD.Caption :=ncolNAME_STUD[IndLangVL];
  colSHIFR.Caption     :=ncolSHIFR[IndLangVL];
end;

procedure TFormPRK_SP_MIN_PERELIK_SHIFR.ActionADDExecute(Sender: TObject);
var
   DataVLAdd :TAArray;
   T:TFormPrK_MIN_PER_SHIFR_Edit;
   TryAgain :boolean;
begin
   TryAgain:=false;
   DataVLAdd :=TAArray.Create;
   DataVLAdd['SHORT_NAME_SPEC'].asString :='' ;
   DataVLAdd['SHORT_NAME_STUD'].AsString :='' ;
   DataVLAdd['SHIFR'].AsString           :='' ;


   if DataSetPrKVuzLicense.FieldValues[ID_NAME]<>Null
      then DataVLAdd['ID'].AsInt64:=StrToInt64(DataSetPrKVuzLicense.FieldValues[ID_NAME]);

   T := TFormPrK_MIN_PER_SHIFR_Edit.Create(self,DataVLAdd);

   T.cxLabelFormCaption.Caption :=nFormKlassSpravEdit_Add[IndLangVL];

   if T.ShowModal=MrOk then
    begin
       StoredProcPrKVuzLicense.Transaction.StartTransaction;
       StoredProcPrKVuzLicense.StoredProcName:=StoredProcAddName;
       StoredProcPrKVuzLicense.Prepare;
       StoredProcPrKVuzLicense.ParamByName('ID_SP_MIN_PERELIK_SPEC').AsInt64 :=DataVLAdd['ID_SP_MIN_PERELIK_SPEC'].AsInt64;
       StoredProcPrKVuzLicense.ParamByName('ID_SP_TYPE_KAT_STUD').AsInt64    :=DataVLAdd['ID_SP_TYPE_KAT_STUD'].AsInt64;
       StoredProcPrKVuzLicense.ParamByName('SHIFR').AsString                 :=DataVLAdd['Shifr'].AsString;
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

procedure TFormPRK_SP_MIN_PERELIK_SHIFR.ActionChangeExecute(
  Sender: TObject);
var
   DataVLChange :TAArray;
   T:TFormPrK_MIN_PER_SHIFR_Edit;
   TryAgain :boolean;
begin
   TryAgain:=false;
   if DataSetPrKVuzLicense.FieldValues[ID_NAME]<>Null then
    begin
       DataVLChange :=TAArray.Create;
       DataVLChange['ID'].AsInt64                     := DataSetPrKVuzLicense.FieldValues[ID_NAME];
       DataVLChange['ID_SP_MIN_PERELIK_SPEC'].AsInt64 := DataSetPrKVuzLicense.FieldValues['ID_SP_MIN_PERELIK_SPEC'];
       DataVLChange['SHORT_NAME_SPEC'].asString       := DataSetPrKVuzLicense.FieldValues['SHORT_NAME_SPEC'];
       DataVLChange['ID_SP_TYPE_KAT_STUD'].AsInt64    := DataSetPrKVuzLicense.FieldValues['ID_SP_TYPE_KAT_STUD'];
       DataVLChange['SHORT_NAME_STUD'].AsString       := DataSetPrKVuzLicense.FieldValues['SHORT_NAME_STUD'];
       DataVLChange['SHIFR'].AsString                 := DataSetPrKVuzLicense.FieldValues['SHIFR'];

       T:=TFormPrK_MIN_PER_SHIFR_Edit.Create(self,DataVLChange);

       T.cxLabelFormCaption.Caption :=nFormKlassSpravEdit_Change[IndLangVL];

       if T.ShowModal=MrOk then
        begin
           StoredProcPrKVuzLicense.Transaction.StartTransaction;
           StoredProcPrKVuzLicense.StoredProcName:=StoredProcChangeName;
           StoredProcPrKVuzLicense.Prepare;
           StoredProcPrKVuzLicense.ParamByName(ID_NAME).AsInt64                  :=DataVLChange['ID'].AsInt64;
           StoredProcPrKVuzLicense.ParamByName('ID_SP_MIN_PERELIK_SPEC').AsInt64 :=DataVLChange['ID_SP_MIN_PERELIK_SPEC'].AsInt64;
           StoredProcPrKVuzLicense.ParamByName('ID_SP_TYPE_KAT_STUD').AsInt64    :=DataVLChange['ID_SP_TYPE_KAT_STUD'].AsInt64;
           StoredProcPrKVuzLicense.ParamByName('SHIFR').AsString                 :=DataVLChange['Shifr'].AsString;

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

procedure TFormPRK_SP_MIN_PERELIK_SHIFR.ActionViewExecute(Sender: TObject);
var
   DataVLView :TAArray;
   T:TFormPrK_MIN_PER_SHIFR_Edit;
begin
   if DataSetPrKVuzLicense.FieldValues[ID_NAME]<>Null then
    begin
       DataVLView :=TAArray.Create;
       DataVLView['ID'].AsInt64                     := DataSetPrKVuzLicense.FieldValues[ID_NAME];
       DataVLView['SHORT_NAME_SPEC'].asString       := DataSetPrKVuzLicense.FieldValues['SHORT_NAME_SPEC'];
       DataVLView['SHORT_NAME_STUD'].AsString       := DataSetPrKVuzLicense.FieldValues['SHORT_NAME_STUD'];
       DataVLView['SHIFR'].AsString                 := DataSetPrKVuzLicense.FieldValues['SHIFR'];


       T:=TFormPrK_MIN_PER_SHIFR_Edit.Create(self,DataVLView);

       T.cxLabelFormCaption.Caption  :=nFormKlassSpravEdit_View[IndLangVL];
       T.cxButtonEditNameSpec.Properties.ReadOnly  :=true;
       T.cxButtonEditNameSpec.Properties.Buttons[0].Visible:=false;
       T.cxButtonEditNameStud.Properties.ReadOnly  :=true;
       T.cxButtonEditNameStud.Properties.Buttons[0].Visible:=false;
       T.cxTextEditSHIFR.Properties.ReadOnly       :=true;
       T.cxButtonEditNameSpec.Style.Color          :=TextViewColor;
       T.cxButtonEditNameStud.Style.Color          :=TextViewColor;
       T.cxTextEditSHIFR.Style.Color               :=TextViewColor;
       T.ShowModal;
       T.Free;
       T:=nil;
       DataVLView.Free;
       DataVLView:=nil;
    end;

end;

procedure TFormPRK_SP_MIN_PERELIK_SHIFR.ActionPrintExecute(
  Sender: TObject);
var
  InputParam :TAArray;
begin
  InputParam :=TAArray.Create;
    InputParam['Name_Bpl'].AsString                     := 'PrK_rptLoader.bpl';
    InputParam['Input']['aDBHANDLE'].AsInteger          := Integer(DataBasePrKVuzLicense.Handle);
    InputParam['Input']['aNameReport'].AsString         := 'MIN_PERELIK_SHIFR';
  uPrK_Loader.ShowAllPrkBpl(self,InputParam);
end;

end.
