import React from 'react';

const Discovery2 = ({ content }) => {
  return (
    <div>
      <h1 className="text-3xl font-bold mb-4">{content?.title}</h1>
      <p>{content?.content}</p>
    </div>
  );
};

export default Discovery2;