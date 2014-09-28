unit uPRK_SP_CEL_ZAMOVNIK;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uKlassVuzLicense, cxStyles, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, cxEdit, DB, cxDBData, FIBDatabase, pFIBDatabase,
  FIBDataSet, pFIBDataSet, FIBQuery, pFIBQuery, pFIBStoredProc, Placemnt,
  dxBar, dxBarExtItems, ActnList, ImgList, dxStatusBar, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxTL, cxMaskEdit,
  cxInplaceContainer, cxDBTL, cxTLData, RxMemDS;

type
  TFormPRK_SP_CEL_ZAMOVNIK = class(TFormKlassVuzLicense)
    cxDBTreeListPrK_SP_CEL_ZAMOVNIK: TcxDBTreeList;
    colNAME: TcxDBTreeListColumn;
    colSHORT_NAME: TcxDBTreeListColumn;
    RxMemoryDataCelZamovCopy: TRxMemoryData;
    procedure FormCreate(Sender: TObject);
    procedure ActionADDExecute(Sender: TObject);
    procedure ActionChangeExecute(Sender: TObject);
    procedure ActionViewExecute(Sender: TObject);
    procedure ActionDELExecute(Sender: TObject);
  private
    ID_PARENT: string ;
    procedure InicCaption;override;
    procedure InicalisationDataSet;override;
    procedure DelProcedure(id: Int64);
  public
    { Public declarations }
  end;

var
  FormPRK_SP_CEL_ZAMOVNIK: TFormPRK_SP_CEL_ZAMOVNIK;

implementation
uses uConstants,AArray,uPRK_SP_CEL_ZAMOVNIK_Edit,uPrK_Resources;
{$R *.dfm}

procedure TFormPRK_SP_CEL_ZAMOVNIK.FormCreate(Sender: TObject);
begin
inherited;
{ID_NAME должен стоять первым так как в SelectSQLText может делаться CloseOpen}
  ID_NAME              :='ID_SP_CEL_ZAMOVNIK';
  ID_PARENT            :='ID_PARENT';
  SelectSQLText        :='Select * from PRK_SP_CEL_ZAMOVNIK_SELECT(:ID_SP_GOD_NABORA, :ID_CN_SP_FORM_STUD, :ID_CN_SP_KAT_STUD, :ID_CN_JN_FACUL_SPEC, :ID_CN_SP_FAK, :ID_FAK_CENTER)';
  StoredProcAddName    :='PRK_SP_CEL_ZAMOVNIK_ADD';
  StoredProcChangeName :='PRK_SP_CEL_ZAMOVNIK_CHANGE';
  StoredProcDelName    :='PRK_SP_CEL_ZAMOVNIK_DEL';

  InicFormCaption      :=nFormPRK_SP_CEL_ZAMOVNIK_Caption[IndLangVL];

  if TFormKlassVuzLicense(self).ResultArray['Input']['CannotEdit'].AsVariant<>Null
     then if  TFormKlassVuzLicense(self).ResultArray['Input']['CannotEdit'].AsInteger=1 then
          begin
             CheckAccessAdd    :='';
             CheckAccessChange :='';
             CheckAccessDel    :='';
          end;

  //CheckAccessAdd    :='';
  //CheckAccessChange :='';
  //CheckAccessDel    :='';
end;

procedure TFormPRK_SP_CEL_ZAMOVNIK.InicalisationDataSet;
begin
    DataBasePrKVuzLicense.close;
    DataSetPrKVuzLicense.Active                            :=false;
    DataBasePrKVuzLicense.Handle                           := TFormKlassVuzLicense(self).DBHANDLE;
    DataBasePrKVuzLicense.DefaultTransaction               := TransactionReadPrKVuzLicense;
    DataSetPrKVuzLicense.Database                          := DataBasePrKVuzLicense;
    DataSetPrKVuzLicense.Transaction                       := TransactionReadPrKVuzLicense;
    DataSetPrKVuzLicense.SelectSQL.Clear;
    DataSetPrKVuzLicense.SQLs.SelectSQL.Text               := SelectSQLText;
    DataSetPrKVuzLicense.ParamByName('ID_SP_GOD_NABORA').AsInt64    := TFormKlassVuzLicense(self).ResultArray['Input']['ID_SP_GOD_NABORA'].AsInt64;
    DataSetPrKVuzLicense.ParamByName('ID_CN_SP_FORM_STUD').AsInt64  := TFormKlassVuzLicense(self).ResultArray['Input']['ID_CN_SP_FORM_STUD'].AsInt64;
    DataSetPrKVuzLicense.ParamByName('ID_CN_SP_KAT_STUD').AsInt64   := TFormKlassVuzLicense(self).ResultArray['Input']['ID_CN_SP_KAT_STUD'].AsInt64;
    DataSetPrKVuzLicense.ParamByName('ID_CN_JN_FACUL_SPEC').AsInt64 := TFormKlassVuzLicense(self).ResultArray['Input']['ID_CN_JN_FACUL_SPEC'].AsInt64;
    DataSetPrKVuzLicense.ParamByName('ID_CN_SP_FAK').AsInt64        := TFormKlassVuzLicense(self).ResultArray['Input']['ID_CN_SP_FAK'].AsInt64;
    DataSetPrKVuzLicense.ParamByName('ID_FAK_CENTER').AsInt64       := TFormKlassVuzLicense(self).ResultArray['Input']['ID_FAK_CENTER'].AsInt64;
    DataSetPrKVuzLicense.CloseOpen(false);
end;

procedure TFormPRK_SP_CEL_ZAMOVNIK.InicCaption;
begin
  inherited;
  colNAME.Caption.Text       :=nColName[IndLangVL];
  colSHORT_NAME.Caption.Text :=nColShortName[IndLangVL];
end;

procedure TFormPRK_SP_CEL_ZAMOVNIK.ActionADDExecute(Sender: TObject);
var
   DataVLAdd :TAArray;
   T:TFormPRK_SP_CEL_ZAMOVNIK_Edit;
   TryAgain :boolean;
begin
   TryAgain:=false;
   DataVLAdd :=TAArray.Create;
   DataVLAdd['NAME'].AsString             :='';
   DataVLAdd['SHORT_NAME'].AsString       :='';
   DataVLAdd['ID_PARENT'].AsString        :=DataSetPrKVuzLicense.FieldValues[ID_NAME];
   DataVLAdd['NAME_CUSTOMER'].AsString    :='';
   // я присваиваю здесь id, чтобы была возможность позицироваться при вызове контрагента
   DataVLAdd['ID_CUSTOMER'].AsInt64       :=-1;

   if DataSetPrKVuzLicense.FieldValues[ID_NAME]<>Null
      then DataVLAdd['ID'].AsInt64:=StrToInt64(DataSetPrKVuzLicense.FieldValues[ID_NAME]);

   T := TFormPRK_SP_CEL_ZAMOVNIK_Edit.Create(self,DataVLAdd);

   T.cxLabelFormCaption.Caption :=nFormKlassSpravEdit_Add[IndLangVL];

   if T.ShowModal=MrOk then
    begin
       StoredProcPrKVuzLicense.Transaction.StartTransaction;
       StoredProcPrKVuzLicense.StoredProcName:=StoredProcAddName;
       StoredProcPrKVuzLicense.Prepare;
       StoredProcPrKVuzLicense.ParamByName('NAME').AsString        :=DataVLAdd['NAME'].AsString;
       StoredProcPrKVuzLicense.ParamByName('SHORT_NAME').AsString  :=DataVLAdd['SHORT_NAME'].AsString;
       StoredProcPrKVuzLicense.ParamByName('ID_PARENT').AsInt64    :=DataVLAdd['ID_PARENT'].AsInt64;
       StoredProcPrKVuzLicense.ParamByName('ID_CUSTOMER').AsInt64  :=DataVLAdd['ID_CUSTOMER'].AsInt64;
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

procedure TFormPRK_SP_CEL_ZAMOVNIK.ActionChangeExecute(Sender: TObject);
var
   DataVLChange :TAArray;
   T:TFormPRK_SP_CEL_ZAMOVNIK_Edit;
   TryAgain :boolean;
begin

   TryAgain:=false;
   if DataSetPrKVuzLicense.FieldValues[ID_NAME]<>Null then
    begin
       if StrToInt(DataSetPrKVuzLicense.FieldValues[ID_NAME])=-1 then
          begin
             ShowMessage(nMsgCannotEdit[IndLangVL]);
             exit;
          end;
       DataVLChange :=TAArray.Create;
       DataVLChange['ID'].AsInt64             :=DataSetPrKVuzLicense.FieldValues[ID_NAME];
       DataVLChange['NAME'].AsString          :=DataSetPrKVuzLicense.FieldValues['NAME'];
       DataVLChange['SHORT_NAME'].AsString    :=DataSetPrKVuzLicense.FieldValues['SHORT_NAME'];
       DataVLChange['ID_PARENT'].AsString     :=DataSetPrKVuzLicense.FieldValues[ID_PARENT];
       if DataSetPrKVuzLicense.FieldValues['ID_CUSTOMER']=null then
        begin
          DataVLChange['ID_CUSTOMER'].AsInt64    :=-1;
          DataVLChange['NAME_CUSTOMER'].AsString :='';
        end
        else begin
          DataVLChange['ID_CUSTOMER'].AsInt64    :=DataSetPrKVuzLicense.FieldValues['ID_CUSTOMER'];
          DataVLChange['NAME_CUSTOMER'].AsString :=DataSetPrKVuzLicense.FieldValues['NAME_CUSTOMER'];
        end;

       T:=TFormPRK_SP_CEL_ZAMOVNIK_Edit.Create(self,DataVLChange);
       T.cxLabelFormCaption.Caption :=nFormKlassSpravEdit_Change[IndLangVL];

       if T.ShowModal=MrOk then
        begin
           StoredProcPrKVuzLicense.Transaction.StartTransaction;
           StoredProcPrKVuzLicense.StoredProcName:=StoredProcChangeName;
           StoredProcPrKVuzLicense.Prepare;
           StoredProcPrKVuzLicense.ParamByName(ID_NAME).AsInt64        :=DataVLChange['ID'].AsInt64;
           StoredProcPrKVuzLicense.ParamByName('NAME').AsString        :=DataVLChange['NAME'].AsString;
           StoredProcPrKVuzLicense.ParamByName('SHORT_NAME').AsString  :=DataVLChange['SHORT_NAME'].AsString;
           StoredProcPrKVuzLicense.ParamByName('ID_PARENT').AsInt64    :=DataVLChange['ID_PARENT'].AsInt64;
           StoredProcPrKVuzLicense.ParamByName('ID_CUSTOMER').AsInt64  :=DataVLChange['ID_CUSTOMER'].AsInt64;
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

procedure TFormPRK_SP_CEL_ZAMOVNIK.ActionViewExecute(Sender: TObject);
var
   DataVLView :TAArray;
   T:TFormPRK_SP_CEL_ZAMOVNIK_Edit;
begin
   if DataSetPrKVuzLicense.FieldValues[ID_NAME]<>Null then
    begin
       DataVLView :=TAArray.Create;
       DataVLView['NAME'].AsString        :=DataSetPrKVuzLicense.FieldValues['NAME'];
       DataVLView['SHORT_NAME'].AsString       :=DataSetPrKVuzLicense.FieldValues['SHORT_NAME'];
       if DataSetPrKVuzLicense.FieldValues['NAME_CUSTOMER']=Null
        then DataVLView['NAME_CUSTOMER'].AsString    :=''
        else DataVLView['NAME_CUSTOMER'].AsString    :=DataSetPrKVuzLicense.FieldValues['NAME_CUSTOMER'];

       T:=TFormPRK_SP_CEL_ZAMOVNIK_Edit.Create(self,DataVLView);
       T.cxLabelFormCaption.Caption  :=nFormKlassSpravEdit_View[IndLangVL];
       T.cxButtonEditCustomers.Properties.ReadOnly           :=true;
       T.cxButtonEditCustomers.Properties.Buttons[0].Visible :=false;
       T.cxTextEditName.Properties.ReadOnly      :=true;
       T.cxTextEditShortName.Properties.ReadOnly :=true;

       T.cxButtonEditCustomers.Style.Color       :=TextViewColor;
       T.cxTextEditName.Style.Color              :=TextViewColor;
       T.cxTextEditShortName.Style.Color         :=TextViewColor;
       T.ShowModal;
       T.Free;
       T:=nil;
       DataVLView.Free;
       DataVLView:=nil;
    end;

end;

procedure TFormPRK_SP_CEL_ZAMOVNIK.ActionDELExecute(Sender: TObject);
var
   i: Int64;
   CanDelCelZam:Boolean;
begin
  CanDelCelZam:=true;
  if DataSetPrKVuzLicense.FieldValues[ID_NAME]<>Null then
    begin
       if StrToInt(DataSetPrKVuzLicense.FieldValues[ID_NAME])=-1 then
          begin
             ShowMessage(nMsgCannotEdit[IndLangVL]);
             exit;
          end
          else begin
              Screen.Cursor := crHourGlass;
              i:=DataSetPrKVuzLicense.FieldValues[ID_NAME];

              // копируем данные сюда, чтоб при проверке в DataSetPrKVuzLicense не сбивался курсор
              RxMemoryDataCelZamovCopy.Close;
              RxMemoryDataCelZamovCopy.LoadFromDataSet(DataSetPrKVuzLicense,DataSetPrKVuzLicense.RecordCount,lmCopy);
              DataSetPrKVuzLicense.locate(ID_NAME,i,[]);
             

                  RxMemoryDataCelZamovCopy.First;
                  while not  RxMemoryDataCelZamovCopy.Eof do
                  begin
                    if i=RxMemoryDataCelZamovCopy.FieldValues[ID_PARENT] then
                     begin
                       CanDelCelZam:=false;
                       Break;
                     end;
                     RxMemoryDataCelZamovCopy.Next;
                  end;

              Screen.Cursor := crDefault;

              if CanDelCelZam=true then
               begin
                   DelProcedure(i);
               end
               else ShowMessage(nMsgCannotDelVerhLevel[IndLangVL]);
          end;
  end;



end;

procedure TFormPRK_SP_CEL_ZAMOVNIK.DelProcedure(id: Int64);
begin
  if prkMessageDlg(nMsgBoxTitle[IndLangVL],nMsgDel[IndLangVL],
                        mtInformation,mbOKCancel,IndLangVL)=mrOK then
         begin
            StoredProcPrKVuzLicense.Transaction.StartTransaction;
            StoredProcPrKVuzLicense.StoredProcName:=StoredProcDelName;
            StoredProcPrKVuzLicense.Prepare;
            StoredProcPrKVuzLicense.ParamByName(ID_NAME).AsInt64:= id;
            try
              StoredProcPrKVuzLicense.ExecProc;
              StoredProcPrKVuzLicense.Transaction.Commit;
              cxDBTreeListPrK_SP_CEL_ZAMOVNIK.GotoPrev;
            except on e :Exception do
               begin
                 MessageBox(Handle,Pchar(nMsgErrorTransaction[IndLangVL]+chr(13)+
                        nMsgTryAgain[IndLangVL]+nMsgOr[IndLangVL]+nMsgToAdmin[IndLangVL]+chr(13)+
                        e.Message),Pchar(nMsgBoxTitle[IndLangVL]),MB_OK or MB_ICONWARNING);
                 StoredProcPrKVuzLicense.Transaction.Rollback;
               end;
            end;
         end;
         Obnovit(StrToInt64(DataSetPrKVuzLicense.FieldValues[ID_NAME]));
end;

end.
