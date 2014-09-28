unit uSpMatOtvCommon;

interface

uses Variants, Classes, IBase, Windows, SysUtils, Messages, Dialogs, FIBQuery, pFIBQuery, FIBDataSet, pFIBDataSet,
     Forms, Buttons, Controls, StdCtrls, Graphics, DB, uResources;

type TFormMode = (fmAdd, fmModify, fmView);

// Extern Sp
TGetManFunction = function(AOwner:TComponent;DBHANDLE:TISC_DB_HANDLE):Variant;stdcall;
TGetMatOtvFunction = function(AOwner:TComponent;DBHANDLE:TISC_DB_HANDLE; aID_USER : Int64):Variant;stdcall;
TShowSpMatOtvFunction = procedure(AOwner:TComponent;DBHANDLE:TISC_DB_HANDLE; aID_USER : Int64);stdcall;

// Func
function  InitSpAllPeople : Boolean;
procedure UnloadAllPackages;
procedure RefreshDataSet(DataSet : TFIBDataSet; ID_Field : String);
function  AskForDelete : Boolean;
function  CheckForEmpty(DataSet : TFIBDataSet) : Boolean;
procedure SearchInDataSet(DataSet : TFIBDataSet; Field_Names : String; Field_Captions : String);
function  ExecQuery(Query : TpFIBQuery; ShowErrorMessage : Boolean = True): Exception;

const
 // Error Codes
 INI_FILE_NO_DATABASE_PATH     = 1;
 INI_FILE_NO_DATABASE_USER     = 2;
 INI_FILE_NO_DATABASE_PASSWORD = 3;

var
 GetMan : TGetManFunction;
 Last_Search_String : String;
 Is_Next_Search     : Boolean;
 Last_Search_Field_Index : Integer;

 // Sklad
 ID_USER                 : Int64;

implementation

uses uSpMatOtvSearchForm;

var
    SpAllPeoplePackageModule : THandle;

function  ExecQuery(Query : TpFIBQuery; ShowErrorMessage : Boolean = True): Exception;
begin
    if Query.Transaction.Active
        then Query.Transaction.Rollback;

    Query.Transaction.StartTransaction;

    try
        Query.ExecQuery;
    except on E:Exception
        do begin
            Query.Transaction.Rollback;
            if ShowErrorMessage then MessageDlg(MAT_STR_SAVE_ERROR+'"' + E.Message + '"',mtError,[mbOk],0);
            ExecQuery := E;
            exit;
        end;
    end;

    ExecQuery := nil;
    Query.Transaction.Commit;
end;

function  CheckForEmpty(DataSet : TFIBDataSet) : Boolean;
begin
    CheckForEmpty := DataSet.IsEmpty;
    if DataSet.IsEmpty then MessageDlg(MAT_STR_NO_RECORD, mtError,[mbOk],0);
end;

function  AskForDelete : Boolean;
begin
    if MessageDlg(MAT_STR_ASK_DELETE, mtConfirmation,[mbYes, mbNo],0) = ID_YES
        then AskForDelete := True
        else AskForDelete := False;
end;

procedure SearchInDataSet(DataSet : TFIBDataSet; Field_Names : String; Field_Captions : String);
var
    Form     : TSearchForm;
    Names    : array of String;
    Field_count : Integer;
    i : Integer;
    s : String;
    
begin
    Form := TSearchForm.Create(nil);

    Form.SearchEdit.Text := Last_Search_String;
    Form.Search_Next.Checked := Is_Next_Search;

    // Смотрим количество пришедших параметров
    Field_count := 0;
    i := 1;
    While i <= Length(Field_Names)
    do begin
        if Field_NAmes[i] = ';' then Field_Count := Field_count + 1;
        i := i + 1;
    end;

    if Length(Field_Names) > 0 then Field_Count := Field_Count + 1;

    if Field_Count = 0
    then begin
        MessageDlg(MAT_STR_FIND_ERROR, mtError,[mbOk],0);
        Exit;
    end;

    SetLength(Names,Field_Count + 1);

    Form.SearchRadioGroup.Items.Clear;

    i := 1;

    While i <= Field_Count - 1 do begin
        s := Copy(Field_Names,1,Pos(';',Field_Names) - 1);
        Delete(Field_Names,1,Pos(';',Field_Names));
        Names[i - 1] := s;

        s := Copy(Field_Captions,1,Pos(';',Field_Captions) - 1);
        Delete(Field_Captions,1,Pos(';',Field_Captions));
        Form.SearchRadioGroup.Items.Add(s);

        i := i + 1;
    end;

    Names[i - 1] := Field_Names;
    Form.SearchRadioGroup.Items.Add(Field_Captions);

    if Form.SearchRadioGroup.Items.Count > 0
    then begin
        Form.SearchRadioGroup.ItemIndex := 0;
        Form.SearchRadioGroup.Height := 20 +  20 * Field_Count;
    end;

    if Last_Search_Field_Index <= Form.SearchRadioGroup.Items.Count
        then Form.SearchRadioGroup.ItemIndex := Last_Search_Field_Index;

    if Form.ShowModal = mrOk
    then begin
        if Not Form.Search_Next.Checked
            then begin
                DataSet.First;
                if not DataSet.Locate(Names[Form.SearchRadioGroup.ItemIndex],Form.SearchEdit.Text,[loCaseInsensitive,loPartialKey])
                then
                    MessageDlg(MAT_STR_NOT_FIND, mtInformation,[mbOk],0);
            end
            else begin
                DataSet.LocateNext(Names[Form.SearchRadioGroup.ItemIndex],Form.SearchEdit.Text,[loCaseInsensitive,loPartialKey]);
            end;
    end;

    Last_Search_String := Form.SearchEdit.Text;
    Is_Next_Search := Form.Search_Next.Checked;

    Last_Search_Field_Index := Form.SearchRadioGroup.ItemIndex;

    Form.Free;
end;

procedure RefreshDataSet(DataSet : TFIBDataSet; ID_Field : String);
var
    old_position : Int64;
begin
    if DataSet.SQLs.SelectSQL.Text = '' then exit;

    if (not DataSet.IsEmpty) and (Id_Field <> '')
        then Old_Position := DataSet.FieldByName(Id_Field).Value
        else Old_Position := -1;

    DataSet.CloseOpen(True);

    if Old_Position <> -1
        then DataSet.Locate(Id_Field,old_position,[]);
end;

procedure UnloadAllPackages;
begin
    UnloadPackage(SpAllPeoplePackageModule);
end;

function InitSpAllPeople : Boolean;
begin
    InitSpAllPeople := True;
    try
        SpAllPeoplePackageModule := LoadPackage('SpAllPeople.bpl');
        @GetMan := GetProcAddress(SpAllPeoplePackageModule,'GetMan');
    except on E:Exception
        do begin
            MessageDlg(E.Message,mtError,[mbOk],0);
            InitSpAllPeople := False;
        end;
    end;
end;

end.
