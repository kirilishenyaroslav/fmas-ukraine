unit uAbout;

{*******************************************************************************
*                                                                              *
* Название модуля :                                                            *
*                                                                              *
*	uAbout                                                                     *
*                                                                              *
* Назначение модуля :                                                          *
*                                                                              *
*	Cоздание информационного окна " О программе "                              *
*                                                                              *
* Copyright  ©  Год 2005,  Автор: Найдёнов Е.А                                 *
*                                                                              *
*******************************************************************************}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, uneTypes;

type

  TfmAbout = class(TForm)

    imgAbout       : TImage;
    sbxAbout       : TScrollBox;

    bbtnAboutOK    : TBitBtn;

    Label4         : TLabel;
    Label2         : TLabel;
    Label5         : TLabel;
    Label7         : TLabel;
    Label8         : TLabel;
    Label10        : TLabel;
    lblCreator     : TLabel;
    lblVersion     : TLabel;
    lblCompany     : TLabel;
    lblAppTitle    : TLabel;
    lblDateCreate  : TLabel;
    lblNameProgram : TLabel;

    procedure FormClose  (Sender: TObject; var Action: TCloseAction);
  end;

  procedure GetFmAbout ( const aFMParams: TRec_FMParams ); stdcall;

  exports GetFmAbout;

implementation

{$R *.dfm}

procedure TfmAbout.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure GetFmAbout ( const aFMParams: TRec_FMParams );
var
    fmAbout : TfmAbout;
begin
  try
      fmAbout := TfmAbout.Create( aFMParams.Owner );
      fmAbout.ShowModal;
  finally
      FreeAndNil( fmAbout );
  end;
end;

end.
