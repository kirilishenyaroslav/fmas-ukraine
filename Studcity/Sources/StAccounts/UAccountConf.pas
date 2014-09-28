unit UAccountConf;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxDropDownEdit, cxCalendar, StdCtrls,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxButtonEdit,
  cxButtons, ExtCtrls, DB, FIBDataSet, pFIBDataSet, cxDBEdit, cxCheckBox;

type
  TfrmAccConf = class(TForm)
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
    UseRecalcOptimization: TcxCheckBox;
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure cxButtonEdit2PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure FormCreate(Sender: TObject);
    procedure cxButtonEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    { Private declarations }
  public
        WorkSch:Int64;
        WorkIdDog:Int64;
        { Public declarations }
  end;


implementation

uses GlobalSpr, UMainAccounts,DogLoaderUnit;
{$R *.dfm}

procedure TfrmAccConf.cxButton2Click(Sender: TObject);
begin
      ModalResult:=mrYes;
end;

procedure TfrmAccConf.cxButton1Click(Sender: TObject);
begin
      ModalResult:=mrNo;
end;

procedure TfrmAccConf.cxButtonEdit2PropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var Res:Variant;
begin
    Res:=GlobalSpr.GetSch(self,TfrmAccountMain(self.owner).WorkDatabase.Handle,fsNormal,Date,1,0,WorkSch);
    if (VarArrayDimCount(Res)>0)
    then begin
               WorkSch:=VarAsType(RES[0][0],varInt64);
               cxButtonEdit2.Text:=VarToStr(RES[0][3])+' "'+VarToStr(RES[0][1])+'"';
    end;
end;

procedure TfrmAccConf.FormCreate(Sender: TObject);
begin
      DogLoaderUnit.Sys_User_Name    :=TfrmAccountMain(self.owner).login;
      DogLoaderUnit.Sys_User_Password:=TfrmAccountMain(self.owner).user;
      DogLoaderUnit.LoadSysData(TfrmAccountMain(self.owner).ReadTransaction);

      SysDataSet.Database:=TfrmAccountMain(self.owner).WorkDatabase;
      SysDataSet.Transaction:=TfrmAccountMain(self.owner).ReadTransaction;

      SysDataSet.SelectSQL.Text:='SELECT * FROM ST_INI_SELECT';
      SysDataSet.Open;

      if (SysDataSet.RecordCount>0)
      then begin
                if SysDataSet.FieldByName('REGEST_NUM').Value<>NULL
                then cxButtonEdit1.Text:=SysDataSet.FieldByName('REGEST_NUM').AsString;

                if SysDataSet.FieldByName('SCH_NUMBER').Value<>NULL
                then cxButtonEdit2.Text:=SysDataSet.FieldByName('SCH_NUMBER').AsString;

                if SysDataSet.FieldByName('ENABLE_DATE').Value<>NULL
                then begin
                          if SysDataSet.FieldByName('ENABLE_DATE').AsInteger=0
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

                if SysDataSet.FieldByName('RECALL_ALL_LIVERS').Value<>NULL
                then UseRecalcOptimization.Checked:=Boolean(SysDataSet.FieldByName('RECALL_ALL_LIVERS').AsInteger);
      end;
end;

procedure TfrmAccConf.cxButtonEdit1PropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
     input:TDogInput;
     res  : TDogResult;
     inputext:TSpravParams;
     DbDogInfo:TSpravParams;
begin
     input:=SYS_DEFAULT_DOG_INPUT;
     input.Owner:=Self;
     input.DBHandle:=TfrmAccountMain(self.owner).WorkDatabase.Handle;
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

end.
