unit Sch_intf;

interface

uses  Windows,  uMainSchSprav, uMainSchSaldo, Classes, Ibase,
      Forms, SchProp, GlobalSpr, Controls, Variants, AppStruClasses,
      Messages;

type
     TSchModule=class(TFMASAppModule,IFMASModule)
     private
           WorkMainForm:TForm;
           Result:Variant;
     public
           procedure Run;
           procedure OnLanguageChange(var Msg:TMessage); message FMAS_MESS_CHANGE_LANG;
           procedure OnGridStylesChange(var Msg:TMessage); message FMAS_MESS_CHANGE_GSTYLE;
           destructor Destroy;
     end;


  {Внешний интерфейс для работы со справочником балансовых счетов}
  function  GetSprMdi           (AOwner:TComponent; DBhandle:TISC_DB_HANDLE; FS:TFormStyle; Book_Date:TDateTime;Root:Integer):integer;stdcall;export;
  function  GetSprModal         (AOwner:TComponent; DBhandle:TISC_DB_HANDLE; FS:TFormStyle; Book_Date:TDateTime;Root:Integer):variant;stdcall;export;
  function  GetSch              (AOwner:TComponent; DBhandle:TISC_DB_HANDLE; FS:TFormStyle; Book_Date:TDateTime;Root:Integer;ID_FU:Integer;Id_sch:Integer):variant;stdcall;export;
  function  GetSchEx            (AOwner:TComponent; DBhandle:TISC_DB_HANDLE; FS:TFormStyle; Book_Date:TDateTime;Root:Integer;ID_FU:Integer;Id_sch:Integer):variant;stdcall;export;
  function GetSchWithOperFilterEx(AOwner:TComponent; DBhandle:TISC_DB_HANDLE; FS:TFormStyle; Book_Date:TDateTime;Root:Integer;ID_FU:Integer;Id_sch:Integer;In_sch_in_credit:Integer):variant;stdcall;export;
  function  GetSchWithOperFilter(AOwner:TComponent; DBhandle:TISC_DB_HANDLE; FS:TFormStyle; Book_Date:TDateTime;Root:Integer;Id_sch:Integer;Id_sch_In:Integer;In_sch_in_credit:Integer):variant;stdcall;export;
  procedure GetSchSaldo         (AOwner: TComponent;DBhandle: TISC_DB_HANDLE;  Actual_Date: TDateTime; Root: Integer); stdcall;export;
  procedure GetSchAnalize       (AOwner: TComponent;DBhandle: TISC_DB_HANDLE;  Actual_Date: TDateTime; Root: Integer); stdcall;export;

  exports  GetSprMdi,
           GetSprModal,
           GetSch,
           GetSchWithOperFilter,
           GetSchSaldo,
           GetSchEx,
           GetSchAnalize,
           GetSchWithOperFilterEx;

implementation

uses SysUtils;

procedure GetSchAnalize(AOwner: TComponent;DBhandle: TISC_DB_HANDLE;  Actual_Date: TDateTime; Root: Integer);
var D,M,Y:Word;
begin
    DecodeDate(Actual_Date, Y,M,D);
    Actual_Date:=EncodeDate(Y,M,1);

    TfrmSchProp.Create(AOwner,DBhandle,Actual_Date,Root);
end;


procedure GetSchSaldo(AOwner: TComponent;DBhandle: TISC_DB_HANDLE;  Actual_Date: TDateTime; Root: Integer);
var D,M,Y:Word;
begin
    DecodeDate(Actual_Date, Y,M,D);
    Actual_Date:=EncodeDate(Y,M,1);

      TfrmSchSaldo.Create(AOwner,DBhandle,Actual_Date,Root);
end;

function GetSchWithOperFilter(AOwner:TComponent; DBhandle:TISC_DB_HANDLE; FS:TFormStyle; Book_Date:TDateTime;Root:Integer;Id_sch:Integer;Id_sch_In:Integer;In_sch_in_credit:Integer):variant;
var Res:variant;
    T:TfrmSchMain;
    D,M,Y:Word;
begin
    DecodeDate(Book_date, Y,M,D);
    Book_date:=EncodeDate(Y,M,1);

    if FS=FsNormal
    then begin
         T:=TfrmSchMain.Create(AOwner,DBhandle,FS,Book_Date,Root,id_sch,Id_sch_In,In_sch_in_credit);
         T.ChooseAllObjects:=false;
         T.SchTreeView.PopupMenu:=nil;
         T.CheckLinearView.Checked:=true;
         T.Panel2.Visible:=false;
         if T.ShowModal=mrYes
         then Res:=T.ResultValue
         else Res:=NULL;
         T.Free;
    end
    else begin
         Res:=integer(TfrmSchMain.Create(AOwner,DBhandle,FS,Book_Date,Root,id_sch,Id_sch_In,In_sch_in_credit));
    end;
    GetSchWithOperFilter:=Res;
end;


function GetSch(AOwner:TComponent; DBhandle:TISC_DB_HANDLE; FS:TFormStyle; Book_Date:TDateTime;Root:Integer;ID_FU:Integer;Id_sch:Integer):variant;
var Res:variant;
    T:TfrmSchMain;
    D,M,Y:Word;
begin
    DecodeDate(Book_date, Y,M,D);
    Book_date:=EncodeDate(Y,M,1);

    if FS=FsNormal   then
    begin
         T:=TfrmSchMain.Create(AOwner,DBhandle,FS,Book_Date,Root,ID_FU,id_sch);
         T.ChooseAllObjects:=false;
         if (ID_FU>0)
         then T.IDSystemComboBox.Enabled:=false;
         T.CheckLinearView.Checked:=true;
         T.SchTreeView.PopupMenu:=nil;
         T.Panel2.Visible:=false;
         if T.ShowModal=mrYes
         then Res:=T.ResultValue
         else Res:=NULL;
         T.Free;
    end;
    if FS=FsStayOnTop then
    begin
         T:=TfrmSchMain.Create(AOwner,DBhandle,FsNormal,Book_Date,Root,ID_FU,id_sch);
         T.SchTreeView.OptionsSelection.MultiSelect:=False;
         T.ChooseAllObjects:=false;
         if (ID_FU>0)
            then  T.IDSystemComboBox.Enabled:=false;
         T.CheckLinearView.Checked:=true;
         T.SchTreeView.PopupMenu:=nil;
         T.Panel2.Visible:=false;
         if T.ShowModal=mrYes
            then Res:=T.ResultValue
            else Res:=NULL;
         T.Free;
    end;
    if FS=FsMDIChild  then
    begin
         Res:=integer(TfrmSchMain.Create(AOwner,DBhandle,FS,Book_Date,Root,ID_FU,id_sch));
    end;
    GetSch:=Res;
end;

function GetSchEx(AOwner:TComponent; DBhandle:TISC_DB_HANDLE; FS:TFormStyle; Book_Date:TDateTime;Root:Integer;ID_FU:Integer;Id_sch:Integer):variant;
var Res:variant;
    T:TfrmSchMain;
    D,M,Y:Word;
begin
    DecodeDate(Book_date, Y,M,D);
    Book_date:=EncodeDate(Y,M,1);

    if FS=FsNormal
    then begin
         T:=TfrmSchMain.Create(AOwner,DBhandle,FS,Book_Date,Root,ID_FU,id_sch);
         T.ChooseAllObjects:=true;
         T.CheckLinearView.Checked:=true;
         T.SchTreeView.PopupMenu:=nil;
         T.Panel2.Visible:=false;
         if T.ShowModal=mrYes
         then Res:=T.ResultValue
         else Res:=NULL;
         T.Free;
    end
    else begin
         Res:=integer(TfrmSchMain.Create(AOwner,DBhandle,FS,Book_Date,Root,ID_FU,id_sch));
    end;
    GetSchEx:=Res;
end;

function GetSchWithOperFilterEx(AOwner:TComponent; DBhandle:TISC_DB_HANDLE; FS:TFormStyle; Book_Date:TDateTime;Root:Integer;ID_FU:Integer;Id_sch:Integer;In_sch_in_credit:Integer):variant;
var Res:variant;
    T:TfrmSchMain;
    D,M,Y:Word;
begin
    DecodeDate(Book_date, Y,M,D);
    Book_date:=EncodeDate(Y,M,1);

    if FS=FsNormal
    then begin
         T:=TfrmSchMain.Create(AOwner,DBhandle,Book_Date,Id_FU,id_sch,In_sch_in_credit);
         T.ChooseAllObjects:=true;
         T.CheckLinearView.Checked:=true;
         T.SchTreeView.PopupMenu:=nil;
         T.Panel2.Visible:=false;
         if T.ShowModal=mrYes
         then Res:=T.ResultValue
         else Res:=NULL;
         T.Free;
    end
    else begin
         Res:=integer(TfrmSchMain.Create(AOwner,DBhandle,FS,Book_Date,Root,ID_FU,id_sch));
    end;
    GetSchWithOperFilterEx:=Res;
end;



function GetSprMdi  (AOwner:TComponent; DBhandle:TISC_DB_HANDLE; FS:TFormStyle; Book_Date:TDateTime;Root:Integer):integer;
var D,M,Y:Word;
begin
    DecodeDate(Book_date, Y,M,D);
    Book_date:=EncodeDate(Y,M,1);

    GetSprMdi:=integer(TfrmSchMain.Create(AOwner,DBhandle,FS,Book_Date,Root));
end;

function GetSprModal(AOwner:TComponent; DBhandle:TISC_DB_HANDLE; FS:TFormStyle; Book_Date:TDateTime;Root:Integer):Variant;
var T:TfrmSchMain;
    Res:Variant;
    D,M,Y:Word;
begin
      DecodeDate(Book_date, Y,M,D);
      Book_date:=EncodeDate(Y,M,1);

      T:=TfrmSchMain.Create(AOwner,DBhandle,FS,Book_Date,Root);
      T.ChooseAllObjects:=false;
      T.SchTreeView.PopupMenu:=nil;
      T.ShowModal;
      Res:=T.ResultValue;
      T.Free;
      GetSprModal:=res;
end;


{ TSchModule }

destructor TSchModule.Destroy;
begin
     if Assigned(self.WorkMainForm) then self.WorkMainForm.Free;
     inherited Destroy;
end;

procedure TSchModule.OnGridStylesChange(var Msg: TMessage);
begin
     //Для будущей реализации
end;

procedure TSchModule.OnLanguageChange(var Msg: TMessage);
begin
     //Для будущей реализации
end;

procedure TSchModule.Run;
var D,M,Y    :Word;
    Book_date:TDateTime;
    FS       :Integer;
    DBhandle :TISC_DB_HANDLE;
    AOwner   :TComponent;
    Root     :Integer;
    ID_FU    :Integer;
    id_sch   :Integer;
begin
    Book_date:=PDateTime(self.InParams.items['Book_date'])^;
    FS       :=PInteger(self.InParams.items['FS'])^;
    DBhandle :=TISC_DB_HANDLE(PInteger(self.InParams.Items['DBhandle'])^);
    AOwner   :=TComponent(self.InParams.items['AOwner']^);
    Root     :=PInteger(self.InParams.Items['Root'])^;
    ID_FU    :=PInteger(self.InParams.Items['ID_FU'])^;
    id_sch   :=PInteger(self.InParams.Items['id_sch'])^;

    DecodeDate(Book_Date, Y,M,D);
    Book_date:=EncodeDate(Y,M,1);

    if (FS=1)
    then begin
              self.WorkMainForm:=TfrmSchMain.Create(AOwner,
                                                    DBhandle,
                                                    fsNormal,
                                                    Book_Date,
                                                    Root,
                                                    ID_FU,
                                                    id_sch);
              with TfrmSchMain(self.WorkMainForm) do
              begin
                    ChooseAllObjects:=false;
                    if (ID_FU>0)
                    then IDSystemComboBox.Enabled:=false;

                    CheckLinearView.Checked:=true;
                    SchTreeView.PopupMenu  :=nil;
                    Panel2.Visible         :=false;

                    if ShowModal=mrYes
                    then self.Result:=ResultValue
                    else self.Result:=NULL;

                    Free;
              end;
    end
    else begin
              TfrmSchMain.Create(AOwner,DBhandle,fsMdiChild,Book_Date,Root,ID_FU,id_sch);
    end;
    self.OutParams.Items['Result']:=PVariant(@self.Result);
end;

initialization
      //Регистрация класса в глобальном реестре
      RegisterAppModule(TSchModule,'SchPackage');
end.
