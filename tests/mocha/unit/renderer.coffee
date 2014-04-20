describe('Renderer', ->
  beforeEach( ->
    @container = $('#test-container').html('').get(0)
  )

  it('objToCss()', ->
    css = Quill.Renderer.objToCss(
      '.editor-container a':
        'font-style': 'italic'
        'text-decoration': 'underline'
      '.editor-container b':
        'font-weight': 'bold'
    )
    expect(css).to.equal([
      '.editor-container a { font-style: italic; text-decoration: underline; }'
      '.editor-container b { font-weight: bold; }'
    ].join('\n'))
  )

  it('buildFrame()', ->
    root = Quill.Renderer.buildFrame(@container)
    expect(@container.querySelectorAll('iframe').length).to.equal(1)
    expect(root.ownerDocument.body.firstChild).to.equal(root)
    expect(root.innerHTML).to.equal('')
  )

  it('constructor', ->
    renderer = new Quill.Renderer(@container)
    expect(@container.querySelectorAll('iframe').length).to.equal(1)
    expect(renderer.root.id).to.not.be(null)
  )
)
