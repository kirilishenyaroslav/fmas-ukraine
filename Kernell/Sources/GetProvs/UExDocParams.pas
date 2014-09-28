unit UExDocParams;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, cxLookAndFeelPainters, StdCtrls, cxButtons,
  cxTextEdit, cxMaskEdit, cxButtonEdit, cxControls, cxContainer, cxEdit,
  cxCheckBox, cxMemo, ActnList, Ibase;

type
  TfrmGetExtParams = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxCheckBox1: TcxCheckBox;
    cxButtonEdit1: TcxButtonEdit;
    cxButtonEdit2: TcxButtonEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    cxButtonEdit3: TcxButtonEdit;
    cxMemo1: TcxMemo;
    cxMemo2: TcxMemo;
    ActionList1: TActionList;
    Action1: TAction;
    Action2: TAction;
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxCheckBox1PropertiesChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxButtonEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonEdit2PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonEdit3PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    DB_ID_DOG  : int64;
    DB_KOD_DOG : int64;
    KR_ID_DOG  : int64;
    KR_KOD_DOG : int64;
    ID_MEN     : Int64;
  end;


implementation

uses UGetDoc,  GlobalSpr, DogLoaderUnit;

{$R *.dfm}

procedure TfrmGetExtParams.cxButton1Click(Sender: TObject);
begin
      if not cxCheckBox1.Checked
      then begin
                KR_ID_DOG  :=DB_ID_DOG;
                KR_KOD_DOG :=DB_KOD_DOG;
      end;
      ModalResult:=MrYes;
end;

procedure TfrmGetExtParams.cxButton2Click(Sender: TObject);
begin
      ModalResult:=MrNo;
end;

procedure TfrmGetExtParams.cxCheckBox1PropertiesChange(Sender: TObject);
begin
      if cxCheckBox1.Checked
      then begin
                Label1.Caption:='Дебетовий договір';
                Label2.Enabled:=true;
                cxButtonEdit2.Enabled:=true;
                KR_ID_DOG  :=-1;
                KR_KOD_DOG :=-1;
                cxMemo2.Enabled:=true;
      end
      else begin
                Label1.Caption:='Договір';
                Label2.Enabled:=false;
                cxButtonEdit2.Enabled:=false;
                cxMemo2.Enabled:=false;
                KR_ID_DOG  :=DB_ID_DOG;
                KR_KOD_DOG :=DB_KOD_DOG;
      end;
end;

procedure TfrmGetExtParams.FormCreate(Sender: TObject);
begin
      DogLoaderUnit.Sys_User_Name:=TfrmDocsInfo(owner).login;
      DogLoaderUnit.Sys_User_Password:=TfrmDocsInfo(owner).user;
      DogLoaderUnit.LoadSysData(TfrmDocsInfo(owner).ReadTransaction);
end;

procedure TfrmGetExtParams.cxButtonEdit1PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
 var input:TDogInput;
     res  : TDogResult;
     inputext:TSpravParams;
     DbDogInfo:TSpravParams;
begin
     input:=SYS_DEFAULT_DOG_INPUT;
     input.Owner:=Self;
     input.DBHandle:=TfrmDocsInfo(owner).WorkDatabase.Handle;
     input.ReadTrans:=TfrmDocsInfo(owner).ReadTransaction.Handle;
     input.WriteTrans:=TfrmDocsInfo(owner).WriteTransaction.Handle;
     input.FormStyle:=fsNormal;
     input.id_Group_add:=2499; //3099
     input.id_Group:=2399;


     input.isZayav:=false;
     res:=ShowDogmain(input);

     try
           if cxCheckBox1.Checked
           then begin
                     if (Res.Id_Dog<>NULL)
                     then begin
                               DB_ID_DOG  :=VarAsType(Res.Id_Dog, varInt64 );
                               KR_ID_DOG  :=VarAsType(Res.Id_Dog, varInt64 );
                     end
                     else begin
                               DB_ID_DOG  :=-1;
                               KR_ID_DOG  :=-1;
                     end;

                     if Res.kod_dog<>NULL
                     then begin
                               DB_KOD_DOG :=VarAsType(Res.kod_dog, varInt64 );
                               KR_KOD_DOG :=VarAsType(Res.kod_dog, varInt64 );
                     end
                     else begin
                               DB_KOD_DOG :=-1;
                               KR_KOD_DOG :=-1;
                     end;
           end
           else begin
                     if (Res.Id_Dog<>NULL)
                     then begin
                               DB_ID_DOG  :=VarAsType(Res.Id_Dog, varInt64 );
                     end
                     else begin
                               DB_ID_DOG  :=-1;
                     end;

                     if Res.kod_dog<>NULL
                     then begin
                               DB_KOD_DOG :=VarAsType(Res.kod_dog, varInt64 );
                     end
                     else begin
                               DB_KOD_DOG :=-1;
                     end;
           end;


           if ((Res.Id_Dog<>NULL) and (Res.Kod_Dog<>NULL))
           then begin

                      inputext:=TSpravParams.Create;
                      DbDogInfo:=TSpravParams.Create;

                      inputext['Database']:=Integer(TfrmDocsInfo(owner).WorkDatabase.Handle);
                      inputext['ReadTransaction']:=Integer(TfrmDocsInfo(owner).ReadTransaction.Handle);
                      inputext['ID_DOG']:=Res.Id_Dog;
                      inputext['KOD_DOG']:=Res.Kod_Dog;


                      try
                            GetDogovorInfo(self,@inputext,@DbDogInfo);
                      except on E:Exception do
                                begin
                                      ShowMessage('Ошибка при работе с информацией по договорам.');
                                end;
                      end;

                      IF DBDogInfo['DOG_TYPE']<>0
                      then begin
                                 cxButtonEdit1.Text:='№ '+VarToStr(DbDogInfo['regest_num'])+'('+VarToStr(DBDogInfo['num_dog'])+')';
                                 cxMemo1.Text:=VarToStr(DbDogInfo['FIO_COMBO']);
                      end
                      else begin
                                 cxButtonEdit1.Text:='№ '+VarToStr(DbDogInfo['regest_num'])+' від '+VarToStr(DbDogInfo['d_dog']);
                                 cxMemo1.Text:=VarToStr(DbDogInfo['name_customer'])+' на суму  '+VarToStr(DbDogInfo['summa']);
                      end;

           end;
     except on e:exception do begin
                              end;
     end
end;

procedure TfrmGetExtParams.cxButtonEdit2PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
 var input:TDogInput;
     res  : TDogResult;
begin
     input:=SYS_DEFAULT_DOG_INPUT;
     input.Owner:=Self;
     input.DBHandle:=TfrmDocsInfo(owner).WorkDatabase.Handle;
     input.ReadTrans:=TfrmDocsInfo(owner).ReadTransaction.Handle;
     input.WriteTrans:=TfrmDocsInfo(owner).WriteTransaction.Handle;
     input.FormStyle:=fsNormal;
     input.id_Group_add:=3099;
     input.id_Group:=3099;
     input.isZayav:=false;
     res:=ShowDogmain(input);

     if (Res.Id_Dog<>NULL)
     then begin
               KR_ID_DOG  :=VarAsType(Res.Id_Dog, varInt64 );
               KR_KOD_DOG :=VarAsType(Res.kod_dog, varInt64 );

               cxButtonEdit2.Text:='№ '+VarToStr(res.regest_num)+' від '+VarToStr(res.d_dog);
               cxMemo2.Text:=VarToStr(Res.name_customer)+' на суму'+VarToStr(Res.summa);
     end

end;

procedure TfrmGetExtParams.cxButtonEdit3PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  HandlePack: HModule;
  MDIFUNC   :function (AOwner:TComponent;DBHANDLE:TISC_DB_HANDLE;MultiSelect:Boolean=False;
                  CanEdit:Boolean=False;Id_Man:Integer=-1):Variant; stdcall;
  Res:Variant;

begin
  HandlePack:=GetModuleHandle('SpAllPeople.bpl');
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+
                                                    'SpAllPeople.bpl');
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0
  then begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('GetMan'));
            if @MDIFUNC<>nil
            then begin
                      Res:=MDIFUNC(self,TfrmDocsInfo(owner).WorkDatabase.Handle,false,False,id_men);
                      if VarArrayDimCount(Res)>0
                      then begin
                                id_men:=Res[0];
                                cxButtonEdit3.Text:=VarToStr(Res[1]);
                      end;
            end;
  end
  else begin
            MessageBox(self.Handle,PChar('Ошибка загрузки модуля SpAllPeople.bpl'),PChar('Увага!'),MB_OK and MB_ICONWARNING);
  end;
end;

procedure TfrmGetExtParams.FormActivate(Sender: TObject);
var DbDogInfo:TSpravParams;
    KrDogInfo:TSpravParams;
    input:TSpravParams;
begin
if (DB_ID_DOG = KR_ID_DOG) and (DB_KOD_DOG = KR_KOD_DOG)
and (KR_ID_DOG<>-1) and (KR_KOD_DOG<>-1)
      then begin
                input:=TSpravParams.Create;
                DbDogInfo:=TSpravParams.Create;

                input['Database']:=Integer(TfrmDocsInfo(owner).WorkDatabase.Handle);
                input['ReadTransaction']:=Integer(TfrmDocsInfo(owner).ReadTransaction.Handle);
                input['ID_DOG']:=DB_ID_DOG;
                input['KOD_DOG']:=DB_KOD_DOG;


                try
                      GetDogovorInfo(self,@input,@DbDogInfo);
                except on E:Exception do
                          begin
                                ShowMessage('Ошибка при работе с информацией по договорам.');
                          end;
                end;

                IF DBDogInfo['DOG_TYPE']<>0
                then begin
                           cxButtonEdit1.Text:='№ '+VarToStr(DbDogInfo['regest_num'])+'('+VarToStr(DBDogInfo['num_dog'])+')';
                           cxMemo1.Text:=VarToStr(DbDogInfo['FIO_COMBO']);
                end
                else begin
                           cxButtonEdit1.Text:='№ '+VarToStr(DbDogInfo['regest_num'])+' від '+VarToStr(DbDogInfo['d_dog']);
                           cxMemo1.Text:=VarToStr(DbDogInfo['name_customer'])+' на суму  '+VarToStr(DbDogInfo['summa']);
                end;

                Label1.Caption:='Договір';
                Label2.Enabled:=false;
                cxButtonEdit2.Enabled:=false;
                cxMemo2.Enabled:=false;

                input.Free;
                DbDogInfo.Free;
      end
      else begin
                input:=TSpravParams.Create;
                DbDogInfo:=TSpravParams.Create;
                KrDogInfo:=TSpravParams.Create;

                Label2.Enabled:=true;
                cxButtonEdit2.Enabled:=true;
                cxMemo2.Enabled:=true;
                cxCheckBox1.Checked:=true;

                input['Database']:=Integer(TfrmDocsInfo(owner).WorkDatabase.Handle);
                input['ReadTransaction']:=Integer(TfrmDocsInfo(owner).ReadTransaction.Handle);
                input['ID_DOG'] :=DB_ID_DOG;
                input['KOD_DOG']:=DB_KOD_DOG;

                try
                      GetDogovorInfo(self,@input,@DbDogInfo);
                except on E:Exception do
                          begin
                                ShowMessage('Ошибка при работе с информацией по договорам.');
                          end;
                end;


                IF DBDogInfo['DOG_TYPE']<>0
                then begin
                           cxButtonEdit1.Text:='№ '+VarToStr(DbDogInfo['regest_num'])+'('+VarToStr(DbDogInfo['NUM_DOG'])+')';
                           cxMemo1.Text:=VarToStr(DbDogInfo['FIO_COMBO']);
                end
                else begin
                           cxButtonEdit1.Text:='№ '+VarToStr(DbDogInfo['regest_num'])+' від '+VarToStr(DbDogInfo['d_dog']);
                           cxMemo1.Text:=VarToStr(DbDogInfo['name_customer'])+' на суму  '+VarToStr(DbDogInfo['summa']);
                end;

                input['Database']:=Integer(TfrmDocsInfo(owner).WorkDatabase.Handle);
                input['ReadTransaction']:=Integer(TfrmDocsInfo(owner).ReadTransaction.Handle);
                input['ID_DOG']:=KR_ID_DOG;
                input['KOD_DOG']:=KR_KOD_DOG;

                try
                      GetDogovorInfo(self,@input,@KrDogInfo);
                except on E:Exception do
                          begin
                                ShowMessage('Ошибка при работе с информацией по договорам.');
                          end;
                end;

                IF KrDogInfo['DOG_TYPE']<>0
                then begin
                           cxButtonEdit2.Text:='№ '+VarToStr(KrDogInfo['regest_num'])+'('+VarToStr(KrDogInfo['NUM_DOG'])+')';
                           cxMemo2.Text:=VarToStr(KrDogInfo['FIO_COMBO']);
                end
                else begin
                           cxButtonEdit2.Text:='№ '+VarToStr(KrDogInfo['regest_num'])+' від '+VarToStr(KrDogInfo['d_dog']);
                           cxMemo2.Text:=VarToStr(KrDogInfo['name_customer'])+' на суму  '+VarToStr(KrDogInfo['summa']);
                end;

                input.Free;
                DbDogInfo.Free;
                KrDogInfo.Free;
      end;
end;

end.
