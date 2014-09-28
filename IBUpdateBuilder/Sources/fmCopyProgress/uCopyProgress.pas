unit uCopyProgress;

{*******************************************************************************
*                                                                              *
* Название модуля :                                                            *
*                                                                              *
*	uCopyProgress                                                              *
*                                                                              *
* Назначение модуля :                                                          *
*                                                                              *
*	Визуализация процесса копирования файлов.                                  *
*                                                                              *
* Copyright  ©  Год 2005,  Автор: Найдёнов Е.А                                 *
*                                                                              *
*******************************************************************************}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxControls,
  cxContainer, cxEdit, cxProgressBar;

type

  TfmCopyProgress = class(TForm)

    btnCancel  : TcxButton;

    lblTotal   : TLabel;
    lblCurrent : TLabel;

    prbTotal   : TcxProgressBar;
    prbCurrent : TcxProgressBar;

  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
