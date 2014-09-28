unit uPrivateCardForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, StdCtrls, Buttons, uCommonSp,
  RxMemDs, ActnList, FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet,
  Ibase, Accmgmt, pFibStoredProc, Registry;

type
  TfmPrivateCard = class(TForm)
    PageControl: TPageControl;
    Panel1: TPanel;
    CloseButton: TBitBtn;
    ActionList: TActionList;
    CloseAction: TAction;
    Panel2: TPanel;
    Label1: TLabel;
    DB: TpFIBDatabase;
    PCardModules: TpFIBDataSet;
    WriteTransaction: TpFIBTransaction;
    ReadTransaction: TpFIBTransaction;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure CloseButtonClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure PageControlChange(Sender: TObject);
    procedure CloseActionExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    Modules: array of TSprav;
    Module_Paths: array of String;
    CreatePCard:Variant;
    Modify:Variant;
    Actual_Date:TDate;
    FIO:Variant;
    AdminMode:Boolean;
    PageReg:TRegistry;
    LocateIndex:Integer;
    IsClickOnPage:Boolean;
    public
          Id_PCard:Variant;   
          procedure Load;
          constructor Create(AOwner:TComponent;
                             DbHandle:TISC_DB_HANDLE;
                             Id_PCard:Variant;
                             CreatePCard:Variant;
                             Modify:Variant;
                             Actual_Date:TDate;
                             FIO:Variant;
                             AdminMode:Boolean;
                             ShowStyle:Variant);reintroduce;
end;

implementation

uses NagScreenUnit, uPrivateCardAdd, BaseTypes, Math;

{$R *.dfm}

procedure TfmPrivateCard.Load;
var
    TabSheet : TTabSheet;
    i        : integer;
    new_vers : boolean;
begin
    IsClickOnPage:=False;
    new_vers := False;
    for i := 1 to ParamCount do if ParamStr(i) = 'newversion' then begin
     new_vers := True;
     Break;
    end;

    if new_vers then
     PCardModules.SelectSQL.Text := 'SELECT * FROM ASUP_MODULES WHERE PARENT_NAME = '
     + QuotedStr('UP_PCARD_DETAILS') + ' order by id_order'
    else
     PCardModules.SelectSQL.Text := 'SELECT * FROM ASUP_MODULES WHERE PARENT_NAME = '
     + QuotedStr('PCARD_DETAILS') + ' order by id_order';

    PCardModules.Open;
    while not PCardModules.Eof do
    begin
         if  ((fibCheckPermission('/ROOT/PCardsList/PrivateCard/'+PCardModules['ASUP_MODULE_NAME'], 'View')=0) and (Modify=0)) or
             ((fibCheckPermission('/ROOT/PCardsList/PrivateCard/'+PCardModules['ASUP_MODULE_NAME'], 'Edit')=0) and (Modify=1))
         then begin
                   SetLength(Modules, Length(Modules)+1);
                   SetLength(Module_Paths, Length(Module_Paths)+1);

                   Modules[High(Modules)] := nil;
                   Module_Paths[High(Module_Paths)] := PCardModules['Package_Name'];
                   TabSheet := TTabSheet.Create(Self);
                   TabSheet.Caption := PCardModules['User_Name'];
                   TabSheet.PageControl := PageControl;
                   TabSheet.Tag := High(Modules);
         end;
         PCardModules.Next;
    end;
    PageControlChange(PageControl);
    IsClickOnPage:=True;
end;

procedure TfmPrivateCard.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
var
    i: Integer;
begin
    for i:=0 to High(Modules) do
        if ( Modules[i] <> nil) and not Modules[i].CanClose then
        begin
            CanClose := False;
            Exit;
        end;
    CanClose := True;
end;

procedure TfmPrivateCard.CloseButtonClick(Sender: TObject);
begin
    Close;
end;

procedure TfmPrivateCard.FormDestroy(Sender: TObject);
var
    i: Integer;
begin
    for i:=0 to High(Modules) do
        if Modules[i] <> nil then Modules[i].Free;
end;

procedure TfmPrivateCard.PageControlChange(Sender: TObject);
var
    ind: Integer;
    Frame: TFrame;
    NagScreen: TNagScreen;
    sprav: TSprav;
    D,M,Y,Hour, Min, Sec, MSec :Word;
begin
    if PageControl.ActivePage = nil then Exit;

    ind := PageControl.ActivePage.Tag;
    if Modules[ind] = nil then
    begin
        NagScreen := TNagScreen.Create(Self);
        NagScreen.Show;
        NagScreen.SetStatusText('Загрузка модулів особистої картки...');

        sprav := GetSprav(Module_Paths[ind]);
        Modules[ind] := sprav;
        with sprav.Input do
        begin
             Append;
             FieldValues['Id_PCard']        := Id_PCard;
             FieldValues['DBHandle']        := Integer(DB.Handle);
             if Fields.FindField('Actual_Date') <> nil
             then FieldValues['Actual_Date']:= Actual_Date;
             FieldValues['Modify']          := Modify;
             Post;
        end;

        Frame := sprav.GetFrame;
        DecodeDate(Date,Y,M,D);
        DecodeTime(Time,Hour, Min, Sec, MSec);
        Frame.Name:=self.Name+IntToStr(Y)+IntToStr(M)+IntToStr(D)+IntToStr(Hour)+IntToStr(Min)+IntToStr(Sec)+IntToStr(Msec);
        
        if not (Frame = nil)
        then begin
                  Frame.Parent :=PageControl.ActivePage;
                  Frame.Align  :=alClient;
        end;

        NagScreen.Free;
    end;
    try
      If IsClickOnPage=True then
       PageReg.WriteString('ModuleLocate', Module_Paths[ind]);
    except on e:Exception
       do ShowMessage(e.Message);
    end;
end;

procedure TfmPrivateCard.CloseActionExecute(Sender: TObject);
begin
    Close;
end;

constructor TfmPrivateCard.Create(AOwner: TComponent; DbHandle: TISC_DB_HANDLE;
                                  Id_PCard: Variant; CreatePCard, Modify: Variant;
                                  Actual_Date: TDate; FIO: Variant; AdminMode: Boolean;
                                  ShowStyle:Variant);
var AddForm: TfmPCardAdd;
    NeedClose:Boolean;
    InsertSP:TpFibStoredProc;
    InfoDS:TpFibDataSet;
    TN:String;
begin
     PageReg:=TRegistry.Create;
     PageReg.RootKey:=HKEY_CURRENT_USER;
     PageReg.OpenKey('\Software\Asup\PCardList', True);
     inherited Create(AOwner);
     Randomize;
     self.Name:=self.Name+IntToStr(RandomRange(1,99999));

     if (ShowStyle=0) or (ShowStyle=NULL)
     then self.FormStyle:=fsNormal
     else self.FormStyle:=fsMDIChild;

     DB.Handle:=DbHandle;
     ReadTransaction.StartTransaction;
     NeedClose:=false;

     self.Id_PCard    :=Id_PCard;
     self.CreatePCard :=CreatePCard;
     self.Modify      :=Modify;
     if self.Modify =NULL
     then self.Modify:=0;
     self.Actual_Date :=Actual_Date;
     self.FIO         :=FIO;
     self.AdminMode   :=AdminMode;

     if (CreatePCard=1)
     then begin
               //Необходимо создать новую личную карточку
               AddForm:=TfmPCardAdd.Create(self);
               if AddForm.ShowModal=mrYes
               then begin
                         try
                               InsertSP:=TpFibStoredProc.Create(self);
                               InsertSP.Database:=db;
                               InsertSP.Transaction:=WriteTransaction;
                               WriteTransaction.StartTransaction;
                               InsertSP.StoredProcName:='ASUP_PCARD_CREATE';
                               InsertSP.ParamByName('ID_MAN').Value     :=AddForm.id_men;
                               InsertSP.ParamByName('TN').Value         :=AddForm.Tn.Value;
                               TN:=VarToStr(AddForm.Tn.Value);
                               InsertSP.ParamByName('CARD_NUMBER').Value:=AddForm.CardNumber.Value;
                               InsertSP.ExecProc;
                               self.Id_PCard:=InsertSP.ParamByName('ID_PCARD').AsInt64;
                               self.FIO:=AddForm.cxButtonEdit1.Text;
                               WriteTransaction.Commit;
                               InsertSP.Close;
                               InsertSP.Free;
                        except on E:Exception do
                               begin
                                    agShowMessage(E.Message);
                                    NeedClose:=true;
                               end
                        end;
               end
               else NeedClose:=true;
               AddForm.Free;
     end
     else begin
               InfoDS:=TpFibDataSet.Create(self);
               InfoDS.Database:=DB;
               InfoDS.Transaction:=ReadTransaction;
               InfoDS.SelectSQL.Text:='Select tn from private_cards where id_pcard='+IntTostr(self.Id_PCard);
               InfoDS.Open;
               if InfoDS.RecordCount>0
               then begin
                         TN:=InfoDS.FieldByName('TN').AsString;
               end;
               InfoDS.Close;
               InfoDS.Free;
     end;

     if not NeedClose
     then begin
               if (self.FIO<>'')
               then self.Caption:=self.Caption+' '+self.FIO+' TH:'+TN;

               if (FIO<>'')
               then Label1.Caption:=self.Caption;

               self.Load;
     end
     else PostMessage(self.Handle, WM_CLOSE,0,0);
end;

procedure TfmPrivateCard.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
      Action:=caFree;
end;

procedure TfmPrivateCard.FormShow(Sender: TObject);
var i:Integer;
begin
   for i:=0 to High(Module_Paths) do
   begin
      if Not VarIsNull(PageReg.ReadString('ModuleLocate')) then
      Begin
         if Module_Paths[i]=PageReg.ReadString('ModuleLocate') then
         begin
            PageControl.ActivePageIndex:=i;
            PageControlChange(PageControl);
         end;
      end
      Else
      Begin
         PageControl.ActivePageIndex:=0;
         PageControlChange(PageControl);
      end;
   end;
end;

end.
