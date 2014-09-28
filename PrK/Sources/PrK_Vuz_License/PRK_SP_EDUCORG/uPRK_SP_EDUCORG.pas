unit uPRK_SP_EDUCORG;

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
  TFormPRK_SP_EDUCORG = class(TFormKlassVuzLicense)
    colNAME_FULL: TcxGridDBColumn;
    colNAME_SHORT: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure ActionADDExecute(Sender: TObject);
    procedure ActionChangeExecute(Sender: TObject);
    procedure ActionViewExecute(Sender: TObject);
    procedure ActionDELExecute(Sender: TObject);
  private
    procedure InicCaption;override;
    procedure InicalisationDataSet;override;
  public
    { Public declarations }
  end;

var
  FormPRK_SP_EDUCORG: TFormPRK_SP_EDUCORG;

implementation
uses uConstants,AArray,uPRK_SP_EDUCORG_Edit;
{$R *.dfm}

procedure TFormPRK_SP_EDUCORG.FormCreate(Sender: TObject);
begin
  inherited;
{ID_NAME должен стоять первым так как в SelectSQLText может делаться CloseOpen}
  ID_NAME              :='ID_ORG';
  SelectSQLText        :='Select * from PRK_SP_EDUCORG_SELECT(:ID_PLACE_IN,:ID_TYPE_IN)';
  StoredProcAddName    :='PRK_SP_EDUCORG_ADD';
  StoredProcChangeName :='PRK_SP_EDUCORG_CHANGE';
  StoredProcDelName    :='PRK_SP_EDUCORG_DEL';

  InicFormCaption      :=nFormPRK_SP_EDUCORG_Caption[IndLangVL];

  //CheckAccessAdd    :='';
  //CheckAccessChange :='';
  //CheckAccessDel    :='';
end;

procedure TFormPRK_SP_EDUCORG.InicCaption;
begin
  inherited;
  colNAME_FULL.Caption  :=nColName[IndLangVL];
  colNAME_SHORT.Caption :=nColShortName[IndLangVL];
end;

procedure TFormPRK_SP_EDUCORG.ActionADDExecute(Sender: TObject);
var
   DataVLAdd :TAArray;
   T:TFormPRK_SP_EDUCORG_Edit;
   TryAgain :boolean;
begin
   TryAgain:=false;
   DataVLAdd :=TAArray.Create;
   DataVLAdd['NAME_FULL'].AsString        :='';
   DataVLAdd['NAME_SHORT'].AsString       :='';
   DataVLAdd['SHORT_NAME_TYPE'].AsString  :='';
   DataVLAdd['NAME_PLACE'].AsString       :='';


   if DataSetPrKVuzLicense.FieldValues[ID_NAME]<>Null
      then DataVLAdd['ID'].AsInt64:=StrToInt64(DataSetPrKVuzLicense.FieldValues[ID_NAME]);

   T := TFormPRK_SP_EDUCORG_Edit.Create(self,DataVLAdd);

   T.cxLabelFormCaption.Caption :=nFormKlassSpravEdit_Add[IndLangVL];

   if T.ShowModal=MrOk then
    begin
       StoredProcPrKVuzLicense.Transaction.StartTransaction;
       StoredProcPrKVuzLicense.StoredProcName:=StoredProcAddName;
       StoredProcPrKVuzLicense.Prepare;
       StoredProcPrKVuzLicense.ParamByName('NAME_FULL').AsString   :=DataVLAdd['NAME_FULL'].AsString;
       StoredProcPrKVuzLicense.ParamByName('NAME_SHORT').AsString  :=DataVLAdd['NAME_SHORT'].AsString;
       StoredProcPrKVuzLicense.ParamByName('ID_TYPE').AsInt64      :=DataVLAdd['ID_TYPE'].AsInt64;
       StoredProcPrKVuzLicense.ParamByName('ID_PLACE').AsInt64     :=DataVLAdd['ID_PLACE'].AsInt64;
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

procedure TFormPRK_SP_EDUCORG.ActionChangeExecute(Sender: TObject);
var
   DataVLChange :TAArray;
   T:TFormPRK_SP_EDUCORG_Edit;
   TryAgain :boolean;
begin

   TryAgain:=false;
   if DataSetPrKVuzLicense.FieldValues[ID_NAME]<>Null then
    begin
       if StrToInt(DataSetPrKVuzLicense.FieldValues['IS_READ_ONLY'])=1 then
          begin
             ShowMessage(nMsgCannotEdit[IndLangVL]);
             exit;
          end;
       DataVLChange :=TAArray.Create;
       DataVLChange['ID'].AsInt64                :=DataSetPrKVuzLicense.FieldValues[ID_NAME];
       DataVLChange['NAME_FULL'].AsString        :=DataSetPrKVuzLicense.FieldValues['NAME_FULL'];
       DataVLChange['NAME_SHORT'].AsString       :=DataSetPrKVuzLicense.FieldValues['NAME_SHORT'];
       DataVLChange['ID_TYPE'].AsInt64           :=DataSetPrKVuzLicense.FieldValues['ID_TYPE'];
       DataVLChange['SHORT_NAME_TYPE'].AsString  :=DataSetPrKVuzLicense.FieldValues['SHORT_NAME_TYPE'];
       DataVLChange['ID_PLACE'].AsInt64          :=DataSetPrKVuzLicense.FieldValues['ID_PLACE'];
       DataVLChange['NAME_PLACE'].AsString       :=DataSetPrKVuzLicense.FieldValues['NAME_PLACE'];

       T:=TFormPRK_SP_EDUCORG_Edit.Create(self,DataVLChange);
       T.cxLabelFormCaption.Caption :=nFormKlassSpravEdit_Change[IndLangVL];

       if T.ShowModal=MrOk then
        begin
           StoredProcPrKVuzLicense.Transaction.StartTransaction;
           StoredProcPrKVuzLicense.StoredProcName:=StoredProcChangeName;
           StoredProcPrKVuzLicense.Prepare;
           StoredProcPrKVuzLicense.ParamByName(ID_NAME).AsInt64        :=DataVLChange['ID'].AsInt64;
           StoredProcPrKVuzLicense.ParamByName('NAME_FULL').AsString   :=DataVLChange['NAME_FULL'].AsString;
           StoredProcPrKVuzLicense.ParamByName('NAME_SHORT').AsString  :=DataVLChange['NAME_SHORT'].AsString;
           StoredProcPrKVuzLicense.ParamByName('ID_TYPE').AsInt64      :=DataVLChange['ID_TYPE'].AsInt64;
           StoredProcPrKVuzLicense.ParamByName('ID_PLACE').AsInt64     :=DataVLChange['ID_PLACE'].AsInt64;
           StoredProcPrKVuzLicense.ParamByName('IS_VUS').AsInteger     :=DataSetPrKVuzLicense['IS_VUS'];
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

procedure TFormPRK_SP_EDUCORG.ActionViewExecute(Sender: TObject);
var
   DataVLView :TAArray;
   T:TFormPRK_SP_EDUCORG_Edit;
begin
   if DataSetPrKVuzLicense.FieldValues[ID_NAME]<>Null then
    begin
       DataVLView :=TAArray.Create;
       DataVLView['ID'].AsInt64                := DataSetPrKVuzLicense.FieldValues[ID_NAME];
       DataVLView['NAME_FULL'].AsString        :=DataSetPrKVuzLicense.FieldValues['NAME_FULL'];
       DataVLView['NAME_SHORT'].AsString       :=DataSetPrKVuzLicense.FieldValues['NAME_SHORT'];
       DataVLView['SHORT_NAME_TYPE'].AsString  :=DataSetPrKVuzLicense.FieldValues['SHORT_NAME_TYPE'];
       if DataSetPrKVuzLicense.FieldValues['NAME_PLACE']<> null
         then DataVLView['NAME_PLACE'].AsString       :=DataSetPrKVuzLicense.FieldValues['NAME_PLACE']
         else DataVLView['NAME_PLACE'].AsString       :='';

       T:=TFormPRK_SP_EDUCORG_Edit.Create(self,DataVLView);

       T.cxLabelFormCaption.Caption  :=nFormKlassSpravEdit_View[IndLangVL];
       T.cxTextEditName.Properties.ReadOnly      :=true;
       T.cxTextEditShortName.Properties.ReadOnly :=true;
       T.cxButtonEditTYPE.Properties.ReadOnly    :=true;
       T.cxButtonEditTYPE.Properties.Buttons[0].Visible  :=false;
       T.cxButtonEditPLACE.Properties.ReadOnly   :=true;
       T.cxButtonEditPLACE.Properties.Buttons[0].Visible :=false;
       T.cxTextEditName.Style.Color              :=TextViewColor;
       T.cxTextEditShortName.Style.Color         :=TextViewColor;
       T.cxButtonEditTYPE.Style.Color            :=TextViewColor;
       T.cxButtonEditPLACE.Style.Color           :=TextViewColor;
       T.ShowModal;
       T.Free;
       T:=nil;
       DataVLView.Free;
       DataVLView:=nil;
    end;

end;

procedure TFormPRK_SP_EDUCORG.ActionDELExecute(Sender: TObject);
begin
    if DataSetPrKVuzLicense.FieldValues[ID_NAME]<>Null
     then   if StrToInt(DataSetPrKVuzLicense.FieldValues['IS_READ_ONLY'])=1
              then ShowMessage(nMsgCannotEdit[IndLangVL])
              else inherited;
end;

procedure TFormPRK_SP_EDUCORG.InicalisationDataSet;
begin
    DataBasePrKVuzLicense.close;
    DataSetPrKVuzLicense.Active                            :=false;
    DataBasePrKVuzLicense.Handle                           := TFormKlassVuzLicense(self).DBHANDLE;
    DataBasePrKVuzLicense.DefaultTransaction               := TransactionReadPrKVuzLicense;
    DataSetPrKVuzLicense.Database                          := DataBasePrKVuzLicense;
    DataSetPrKVuzLicense.Transaction                       := TransactionReadPrKVuzLicense;
    DataSetPrKVuzLicense.SelectSQL.Clear;
    DataSetPrKVuzLicense.SQLs.SelectSQL.Text               := SelectSQLText;
    DataSetPrKVuzLicense.ParamByName('ID_PLACE_IN').AsInt64:= TFormKlassVuzLicense(self).ResultArray['Input']['ID_PLACE_IN'].AsInt64;
    DataSetPrKVuzLicense.ParamByName('ID_TYPE_IN').AsInt64 := TFormKlassVuzLicense(self).ResultArray['Input']['ID_TYPE_IN'].AsInt64;
    DataSetPrKVuzLicense.CloseOpen(false);
end;

end.
