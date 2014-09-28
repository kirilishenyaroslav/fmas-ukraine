unit uAccount_Conf;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxDropDownEdit, cxCalendar, StdCtrls,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxButtonEdit,
  cxButtons, ExtCtrls, DB, FIBDataSet, pFIBDataSet, cxDBEdit, cxCheckBox, iBase,
  uDM;

type
  TfrmAccount_Conf = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxButtonEdit1: TcxButtonEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    cxButtonEdit2: TcxButtonEdit;
    SysDataSet: TpFIBDataSet;
    SysDataSource: TDataSource;
    cxDateEdit1: TcxDateEdit;
    cxCheckBox1: TcxCheckBox;
    cxComboBox1: TcxComboBox;
    Label4: TLabel;
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure cxButtonEdit2PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure FormCreate(Sender: TObject);
    procedure cxButtonEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    DM : TfrmAccounts_DM;
  public
    WorkSch:Int64;
    WorkIdDog:Int64;
    constructor create(aOwner : TComponent; aHandle : TISC_DB_HANDLE); reintroduce;
  end;


implementation

uses GlobalSpr, uMainAccounts, DogLoaderUnit;
{$R *.dfm}

procedure TfrmAccount_Conf.cxButton2Click(Sender: TObject);
begin
  ModalResult := mrYes;
end;

procedure TfrmAccount_Conf.cxButton1Click(Sender: TObject);
begin
  ModalResult := mrNo;
end;

procedure TfrmAccount_Conf.cxButtonEdit2PropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  Res:Variant;
begin
    Res := GlobalSpr.GetSch(self, DM.DB.Handle, fsNormal, Date, 1, 0, WorkSch);
    if (VarArrayDimCount(Res)>0)
    then begin
               WorkSch:=VarAsType(RES[0][0],varInt64);
               cxButtonEdit2.Text:=VarToStr(RES[0][3])+' "'+VarToStr(RES[0][1])+'"';
    end;
end;

procedure TfrmAccount_Conf.FormCreate(Sender: TObject);
begin
  //DogLoaderUnit.Sys_User_Name     := TfrmAccountMain(self.owner).login;
  //DogLoaderUnit.Sys_User_Password := TfrmAccountMain(self.owner).user;

  DogLoaderUnit.LoadSysData(DM.ReadTransaction);

  SysDataSet.Database    := DM.DB;
  SysDataSet.Transaction := DM.ReadTransaction;

      SysDataSet.SelectSQL.Text:='SELECT * FROM CN_DT_ACCOUNTS_INI_SELECT';
      SysDataSet.Open;

      if (SysDataSet.RecordCount>0)
      then begin
                if SysDataSet.FieldByName('REGEST_NUM').Value<>NULL
                then cxButtonEdit1.Text:=SysDataSet.FieldByName('REGEST_NUM').AsString;

                if SysDataSet.FieldByName('SCH_NUMBER').Value<>NULL
                then cxButtonEdit2.Text:=SysDataSet.FieldByName('SCH_NUMBER').AsString;

                if SysDataSet.FieldByName('ENABLE_DATE').Value<>NULL
                then begin
                          if SysDataSet.FieldByName('ENABLE_DATE').AsInteger=1
                          then begin
                                    cxDateEdit1.Properties.ReadOnly:=false;
                                    cxDateEdit1.Date:=SysDataSet.FieldByName('MBOOK_DATE').Value;
                          end
                          else begin
                                    cxDateEdit1.Properties.ReadOnly:=true;
                                    cxDateEdit1.Date:=SysDataSet.FieldByName('DATE_START').Value;
                          end;
                end;

                if SysDataSet.FieldByName('WORK_SCH').Value<>NULL
                then WorkSch:=StrToInt64(SysDataSet.FieldByName('WORK_SCH').ASString);

                if SysDataSet.FieldByName('GLOBAL_ID_DOG').Value<>NULL
                then WorkIdDog:=StrToInt64(SysDataSet.FieldByName('GLOBAL_ID_DOG').ASString);

                if SysDataSet.FieldByName('ONLY_MAIN_DOCS').Value<>NULL
                then cxCheckBox1.Checked:=Boolean(SysDataSet.FieldByName('ONLY_MAIN_DOCS').ASInteger);

                if SysDataSet.FieldByName('CALC_MODE').Value<>NULL
                then cxComboBox1.ItemIndex:=SysDataSet.FieldByName('CALC_MODE').ASInteger;
      end;
end;

procedure TfrmAccount_Conf.cxButtonEdit1PropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  input:TDogInput;
  res  : TDogResult;
  inputext:TSpravParams;
  DbDogInfo:TSpravParams;
begin
  input := SYS_DEFAULT_DOG_INPUT;
  input.Owner:=Self;
  input.DBHandle := DM.DB.Handle;
  input.ReadTrans:=TfrmAccountMain(self.owner).ReadTransaction.Handle;
     input.WriteTrans:=TfrmAccountMain(self.owner).WriteTransaction.Handle;
     input.FormStyle:=fsNormal;
     input.id_Group_add:=2499; //3099
     input.id_Group:=2399;


     input.isZayav:=false;
     res:=ShowDogmain(input);

     try
           if (Res.Id_Dog<>NULL)
           then begin
                     WorkIdDog  :=VarAsType(Res.Id_Dog, varInt64 );
           end;

           if ((Res.Id_Dog<>NULL) and (Res.Kod_Dog<>NULL))
           then begin

                      inputext:=TSpravParams.Create;
                      DbDogInfo:=TSpravParams.Create;

                      inputext['Database']:=Integer(TfrmAccountMain(self.owner).WorkDatabase.Handle);
                      inputext['ReadTransaction']:=Integer(TfrmAccountMain(self.owner).ReadTransaction.Handle);
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
                      end
                      else begin
                                 cxButtonEdit1.Text:='№ '+VarToStr(DbDogInfo['regest_num'])+' від '+VarToStr(DbDogInfo['d_dog']);
                      end;
           end;
     except on e:exception do begin
                              end;
     end
end;

constructor TfrmAccount_Conf.create(aOwner: TComponent;
  aHandle: TISC_DB_HANDLE);
begin
  inherited create(aOwner);

  DM := TfrmAccounts_DM.Create(aOwner);
  DM.DB.Handle := aHandle;
  DM.DB.Connected := True;
  DM.ReadTransaction.StartTransaction;
end;

end.
